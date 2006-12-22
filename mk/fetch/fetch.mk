# $NetBSD: fetch.mk,v 1.23 2006/11/25 21:33:39 jdolecek Exp $

_MASTER_SITE_BACKUP=	${MASTER_SITE_BACKUP:=${DIST_SUBDIR:=/}}
_MASTER_SITE_OVERRIDE=	${MASTER_SITE_OVERRIDE:=${DIST_SUBDIR:=/}}

ALLFILES?=	${DISTFILES} ${PATCHFILES}
ALLFILES:=	$(sort ${ALLFILES})		# remove duplicates
CKSUMFILES?=	${ALLFILES}
CKSUMFILES:=	$(filter-out ${IGNOREFILES},${CKSUMFILES})


# List of all files, with ${DIST_SUBDIR} in front.  Used for fetch and checksum.
ifdef DIST_SUBDIR
_CKSUMFILES?=	$(addprefix ${DIST_SUBDIR}/,${CKSUMFILES})
_DISTFILES?=	$(addprefix ${DIST_SUBDIR}/,${DISTFILES})
_IGNOREFILES?=	$(addprefix ${DIST_SUBDIR}/,${IGNOREFILES})
_PATCHFILES?=	$(addprefix ${DIST_SUBDIR}/,${PATCHFILES})
else
_CKSUMFILES?=	${CKSUMFILES}
_DISTFILES?=	${DISTFILES}
_IGNOREFILES?=	${IGNOREFILES}
_PATCHFILES?=	${PATCHFILES}
endif
_ALLFILES?=	${_DISTFILES} ${_PATCHFILES}

_BUILD_DEFS+=	_DISTFILES _PATCHFILES

# Set up _ORDERED_SITES to work out the exact list of sites for every file,
# using the dynamic sites script, or ordering according to the master site
# list, MASTER_SORT_RANDOM randomization feature, or the patterns in
# MASTER_SORT or MASTER_SORT_REGEX as appropriate.
# No actual sorting is done until _ORDERED_SITES is expanded.
#
ifneq (,$(call isyes,${MASTER_SORT_RANDOM}))
_MASTER_RAND_AWK= BEGIN { srand(seed); ORS = " " } {			\
		n = split($$0, site);					\
		for (i = n; i > 0; i--) {				\
			ir = int(rand() * i + 1);			\
			t = site[i]; site[i] = site[ir]; site[ir] = t;	\
			print site[i]; } }
_RAND_SITES_CMD= | ${AWK} -v seed=$$$$ '${_MASTER_RAND_AWK}'
_SORT_SITES_FULL_CMD= ${ECHO} $$unsorted_sites ${_RAND_SITES_CMD}
_ORDERED_SITES= ${_MASTER_SITE_OVERRIDE} `${_SORT_SITES_FULL_CMD}`
else
_ORDERED_SITES= ${_MASTER_SITE_OVERRIDE} $$unsorted_sites
endif


#
# Associate each file to fetch with the correct site(s).
#
ifneq (,${_DISTFILES})
define _FETCHFILE_VAR
SITES.$(subst =,--,$(notdir ${fetchfile}))?= ${MASTER_SITES}
endef
$(foreach fetchfile,${_DISTFILES},$(eval ${_FETCHFILE_VAR}))
endif

ifneq (,${_PATCHFILES})
define _PATCHFILES_VAR
SITES.$(subst =,--,$(notdir ${fetchfile}))?= ${PATCH_SITES}
endef
$(foreach fetchfile,${_PATCHFILES},$(eval ${_FETCHFILE_VAR}))
endif


# --- fetch (PUBLIC) -------------------------------------------------
#
# fetch is a public target to fetch all of the package distribution
# files.
#
_FETCH_TARGETS+=	bootstrap-depends
_FETCH_TARGETS+=	pre-fetch
_FETCH_TARGETS+=	do-fetch
_FETCH_TARGETS+=	post-fetch

.PHONY: fetch
fetch: ${_FETCH_TARGETS}


# --- pre-fetch, do-fetch, post-fetch (PUBLIC, override) -------------
#
# {pre,do,post}-fetch are the heart of the package-customizable
# fetch targets, and may be overridden within a package Makefile.
#

do%fetch: do-fetch-file .FORCE
	@${DO_NADA}

.PHONY: pre-fetch post-fetch

pre-fetch:

post-fetch:

.PHONY: do-fetch-file
do-fetch-file: $(addprefix ${DISTDIR}/,${_ALLFILES}) #error-check


# --- fetch-check-interactive (PRIVATE) ------------------------------
#
# fetch-check-interactive is a macro target that is inserted at the
# head of a target's command list, and will check whether the fetch
# stage for this package requires user interaction to proceed.
#
ifneq (,$(filter fetch,${INTERACTIVE_STAGE}))
$(addprefix ${DISTDIR}/,${_ALLFILES})::
  ifndef FETCH_MESSAGE
	@${TEST} ! -f @@ || exit 0;					\
	${ERROR_MSG} "The fetch stage of this package requires user interaction to download"; \
	${ERROR_MSG} "the distfiles.  Please fetch the distfiles manually and place them in:"; \
	${ERROR_MSG} "    ${_DISTDIR}";					\
	if ${TEST} -n ${MASTER_SITES}""; then				\
		${ERROR_MSG} "The distfiles are available from:";	\
		for site in ${MASTER_SITES}; do				\
			${ERROR_MSG} "    $$site";			\
		done;							\
	fi;								\
	if ${TEST} -n ${HOMEPAGE}""; then				\
		${ERROR_MSG} "See the following URL for more details:";	\
		${ERROR_MSG} "    "${HOMEPAGE};			\
	fi;								\
	${TOUCH} ${_INTERACTIVE_COOKIE};				\
	exit 1
  else
	@${TEST} ! -f @@ || exit 0;					\
	${ERROR_MSG} "======================================================================"; \
	${ERROR_MSG} "";						\
	for line in ${FETCH_MESSAGE}; do ${ERROR_MSG} "$$line"; done;	\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "======================================================================"; \
	exit 1
  endif
endif


# --- do-fetch-file (PRIVATE) ----------------------------------------
#
# do-fetch-file is a macro target that runs the "fetch" script to
# transfer the files from the appropriate sites if needed.
#
#
# FETCH_CMD is the program used to fetch files.  It must understand
#	fetching files located via URLs, e.g. NetBSD's ftp, net/tnftp,
#	etc.  The default value is set in pkgsrc/mk/defaults/mk.conf.
#
# The following variables are all lists of options to pass to he command
# used to do the actual fetching of the file.
#
# FETCH_BEFORE_ARGS appear before all other options on the command line.
#
# FETCH_AFTER_ARGS appear after all other options on the command line.
#
# FETCH_RESUME_ARGS appears just after FETCH_BEFORE_ARGS and is the set
#	of options for causing the command to resume a previous transfer.
#
# FETCH_OUTPUT_ARGS is a set of options for specifying the name of the
#	local file that will hold the contents of the fetched file.
#
# FAILOVER_FETCH, if defined, will cause a checksum to be performed during
#	a fetch to verify the transferred file is correct; if the checksum
#	is incorrect, then the next site will be tried.
#
# PKG_RESUME_TRANSFERS is a yes/no variable that causes the fetch script
#	to try to resume interrupted file transfers to avoid downloading
#	the whole file.  The default is set in pkgsrc/mk/defaults/mk.conf.
#
#FETCH_CMD?=		ftp	# default is set by pkgsrc/mk/defaults/mk.conf
FETCH_BEFORE_ARGS?=	${_FETCH_BEFORE_ARGS.$(notdir ${FETCH_CMD})}
FETCH_AFTER_ARGS?=	${_FETCH_AFTER_ARGS.$(notdir ${FETCH_CMD})}
FETCH_RESUME_ARGS?=	${_FETCH_RESUME_ARGS.$(notdir ${FETCH_CMD})}
FETCH_OUTPUT_ARGS?=	${_FETCH_OUTPUT_ARGS.$(notdir ${FETCH_CMD})}

_FETCH_BEFORE_ARGS.ftp=		# empty
_FETCH_AFTER_ARGS.ftp=		# empty
_FETCH_RESUME_ARGS.ftp=		-R
_FETCH_OUTPUT_ARGS.ftp=		-o

_FETCH_CMD=\
	${SETENV} CHECKSUM=$(call quote,${_CHECKSUM_CMD})		\
		CP=${TOOLS_CP}						\
		ECHO=${TOOLS_ECHO}					\
		FETCH_CMD=${FETCH_CMD}					\
		FETCH_BEFORE_ARGS=$(call quote,${FETCH_BEFORE_ARGS})	\
		FETCH_AFTER_ARGS=$(call quote,${FETCH_AFTER_ARGS})	\
		FETCH_RESUME_ARGS=$(call quote,${FETCH_RESUME_ARGS})	\
		FETCH_OUTPUT_ARGS=$(call quote,${FETCH_OUTPUT_ARGS})	\
		MKDIR=$(call quote,${TOOLS_MKDIR})			\
		MV=$(call quote,${TOOLS_MV})				\
		TEST=$(call quote,${TOOLS_TEST})			\
		TOUCH=$(call quote,${TOOLS_TOUCH})			\
		WC=$(call quote,${TOOLS_WC})				\
		${SH} ${PKGSRCDIR}/mk/fetch/fetch

ifdef PKG_VERBOSE
_FETCH_ARGS+=	${PKG_VERBOSE}
endif
ifeq (yes,$(call exists,${DISTINFO_FILE}))
_FETCH_ARGS+=	-f $(call quote,${DISTINFO_FILE})
endif
ifeq (,${DIST_SUBDIR})
_FETCH_ARGS+=	-d .
else
_FETCH_ARGS+=	-d ${DIST_SUBDIR}
endif

$(addprefix ${DISTDIR}/,${_ALLFILES})::
	@${STEP_MSG} "Fetching $(notdir $@)"
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG}					\
	for d in "" $(subst :, ,${DIST_PATH}); do			\
		case $$d in						\
		""|${DISTDIR})	continue ;;				\
		esac;							\
		file="$$d/${DIST_SUBDIR}/$(notdir $@)";			\
		if ${TEST} -f $$file; then				\
			${ECHO} "Using $$file";				\
			${RM} -f $@;					\
			${LN} -s $$file $@;				\
		fi;							\
	done
	${_PKG_SILENT}${_PKG_DEBUG}set -e;				\
	unsorted_sites="${SITES.$(subst =,--,$(notdir $@))}";		\
	sites="${_ORDERED_SITES} ${_MASTER_SITE_BACKUP}";		\
	cd $(patsubst %/${DIST_SUBDIR},%,$(dir $@)) &&			\
	${_FETCH_CMD} ${_FETCH_ARGS} $(notdir $@) $$sites
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if ${TEST} ! -f $@; then					\
		${ERROR_MSG} "Could not fetch the following file:";	\
		${ERROR_MSG} "    $(notdir $@)";			\
		${ERROR_MSG} "";					\
		${ERROR_MSG} "Please retrieve this file manually into:"; \
		${ERROR_MSG} "    $(dir $@)";				\
		exit 1;							\
	fi
