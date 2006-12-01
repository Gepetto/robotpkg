# $NetBSD: extract.mk,v 1.17 2006/10/09 02:37:32 rillig Exp $
#
# The following variables may be set by the package Makefile and
# specify how extraction happens:
#
# EXTRACT_DIR
#	The directory into which the files are extracted.
#
#	Default value: ${WRKSRC}
#
#    EXTRACT_CMD is a shell command list that extracts the contents of
#	an archive named by the variable ${DOWNLOADED_DISTFILE} to the
#	current working directory.  The default is ${EXTRACT_CMD_DEFAULT}.
#
#    EXTRACT_OPTS is a list of options to pass to the "extract" script
#	when using EXTRACT_CMD_DEFAULT.  See the comments at the head of
#	the "extract" script for a definitive list of the available
#	options.  The default list is empty.
#
#    EXTRACT_USING specifies the tool used to extract tar/ustar-format
#	archives when using EXTRACT_CMD_DEFAULT.  The possible values are
#	"gtar", "nbtar", and "pax".  By default, we use the "nbtar" tool
#	(pkgsrc's pax-as-tar).
#
#    EXTRACT_ELEMENTS is a list of files within the distfile to extract
#	when using EXTRACT_CMD_DEFAULT.  By default, this is empty, which
#	causes all files within the archive to be extracted.
#
# The following are read-only variables that may be used within a package
#	Makefile:
#
#    DOWNLOADED_DISTFILE represents the path to the distfile that is
#	currently being extracted, and may be used in custom EXTRACT_CMD
#	overrides, e.g.
#
#	    EXTRACT_CMD= ${TAIL} +25 ${DOWNLOADED_DISTFILE} > foo.pl
#
#    EXTRACT_CMD_DEFAULT uses the "extract" script to unpack archives.  The
#	precise manner in which extraction occurs may be tweaked by setting
#	EXTRACT_OPTS, EXTRACT_USING and EXTRACT_ELEMENTS.
#

EXTRACT_DIR?=		${WRKDIR}

_COOKIE.extract=	${WRKDIR}/.extract_done

# --- extract (PUBLIC) -----------------------------------------------
#
# extract is a public target to perform extraction.
#
_EXTRACT_TARGETS+=	check-vulnerable
_EXTRACT_TARGETS+=	tools
_EXTRACT_TARGETS+=	acquire-extract-lock
_EXTRACT_TARGETS+=	${_COOKIE.extract}
_EXTRACT_TARGETS+=	release-extract-lock

.PHONY: extract
ifeq (yes,$(call exists,${_COOKIE.extract}))
extract:
	@${DO_NADA}
else
extract: ${_EXTRACT_TARGETS}
endif

.PHONY: acquire-extract-lock release-extract-lock
acquire-extract-lock: acquire-lock
release-extract-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.extract}))
${_COOKIE.extract}:
	@${DO_NADA}
else
${_COOKIE.extract}: real-extract
endif

# --- real-extract (PRIVATE) -----------------------------------------
#
# real-extract is a helper target onto which one can hook all of the
# targets that do the actual extraction work.
#
_REAL_EXTRACT_TARGETS+=	extract-message
#_REAL_EXTRACT_TARGETS+=	extract-vars
_REAL_EXTRACT_TARGETS+=	extract-dir
_REAL_EXTRACT_TARGETS+=	pre-extract
_REAL_EXTRACT_TARGETS+=	do-extract
_REAL_EXTRACT_TARGETS+=	post-extract
_REAL_EXTRACT_TARGETS+=	extract-cookie
#_REAL_EXTRACT_TARGETS+=	error-check

.PHONY: real-extract
real-extract: ${_REAL_EXTRACT_TARGETS}

.PHONY: extract-message
extract-message:
	@${PHASE_MSG} "Extracting for ${PKGNAME}"

.PHONY: extract-dir
extract-dir:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} ${EXTRACT_DIR}


# --- extract-cookie (PRIVATE) ---------------------------------------
#
# extract-cookie creates the "extract" cookie file.  The contents
# are the name of the package.
#
.PHONY: extract-cookie
extract-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${_COOKIE.extract} || ${FALSE}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir ${_COOKIE.extract})
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${PKGNAME} > ${_COOKIE.extract}


# --- pre-extract, do-extract, post-extract (PUBLIC, override) -------
#
# {pre,do,post}-extract are the heart of the package-customizable
# extract targets, and may be overridden within a package Makefile.
#
.PHONY: pre-extract do-extract post-extract

EXTRACT_USING?=		tar
EXTRACT_ELEMENTS?=	# empty

###
### Build the default extraction command
###
ifdef EXTRACT_OPTS_BIN
_EXTRACT_ENV+=	EXTRACT_OPTS_BIN=${EXTRACT_OPTS_BIN}
endif
ifdef EXTRACT_OPTS_LHA
_EXTRACT_ENV+=	EXTRACT_OPTS_LHA=${EXTRACT_OPTS_LHA}
endif
ifdef EXTRACT_OPTS_PAX
_EXTRACT_ENV+=	EXTRACT_OPTS_PAX=${EXTRACT_OPTS_PAX}
endif
ifdef EXTRACT_OPTS_RAR
_EXTRACT_ENV+=	EXTRACT_OPTS_RAR=${EXTRACT_OPTS_RAR}
endif
ifdef EXTRACT_OPTS_TAR
_EXTRACT_ENV+=	EXTRACT_OPTS_TAR=${EXTRACT_OPTS_TAR}
endif
ifdef EXTRACT_OPTS_ZIP
_EXTRACT_ENV+=	EXTRACT_OPTS_ZIP=${EXTRACT_OPTS_ZIP}
endif
ifdef EXTRACT_OPTS_ZOO
_EXTRACT_ENV+=	EXTRACT_OPTS_ZOO=${EXTRACT_OPTS_ZOO}
endif
ifdef TOOLS_BZCAT
_EXTRACT_ENV+=	BZCAT=${TOOLS_BZCAT}
endif
ifdef TOOLS_CAT
_EXTRACT_ENV+=	CAT=${TOOLS_CAT}
endif
ifdef TOOLS_CP
_EXTRACT_ENV+=	CP=${TOOLS_CP}
endif
ifdef TOOLS_ECHO
_EXTRACT_ENV+=	ECHO=${TOOLS_ECHO}
endif
ifdef TOOLS_CMDLINE.gzcat
_EXTRACT_ENV+=	GZCAT=${TOOLS_CMDLINE.gzcat}
endif
ifdef TOOLS_LHA
_EXTRACT_ENV+=	LHA=${TOOLS_LHA}
endif
ifdef TOOLS_MKDIR
_EXTRACT_ENV+=	MKDIR=${TOOLS_MKDIR}
endif
ifdef TOOLS_RM
_EXTRACT_ENV+=	RM=${TOOLS_RM}
endif
ifdef TOOLS_PAX
_EXTRACT_ENV+=	PAX=${TOOLS_PAX}
endif
ifdef TOOLS_SH
_EXTRACT_ENV+=	SH=${TOOLS_SH}
endif
ifdef TOOLS_TAR
_EXTRACT_ENV+=	TAR=${TOOLS_TAR}
endif
ifdef TOOLS_TEST
_EXTRACT_ENV+=	TEST=${TOOLS_TEST}
endif
ifdef TOOLS_UNRAR
_EXTRACT_ENV+=	UNRAR=${TOOLS_UNRAR}
endif
ifdef TOOLS_UNZIP_CMD
_EXTRACT_ENV+=	UNZIP_CMD=${TOOLS_UNZIP_CMD}
endif
ifdef TOOLS_UNZOO
_EXTRACT_ENV+=	UNZOO=${TOOLS_UNZOO}
endif
_EXTRACT_ENV+=	${EXTRACT_ENV}

ifdef TOOLS_TAR
EXTRACT_OPTS+=	-t ${TOOLS_TAR}
endif

EXTRACT_CMD_DEFAULT=							\
	${SETENV} ${_EXTRACT_ENV}					\
	${SH} ${PKGSRCDIR}/mk/extract/extract				\
		${EXTRACT_OPTS}						\
		${DOWNLOADED_DISTFILE} ${EXTRACT_ELEMENTS}

EXTRACT_CMD?=	${EXTRACT_CMD_DEFAULT}

DOWNLOADED_DISTFILE=	$${extract_file}

do%extract: ${WRKDIR}
	${_OVERRIDE_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach __file__,${EXTRACT_ONLY},					\
	extract_file=${_DISTDIR}/${__file__}; export extract_file;	\
	cd ${WRKDIR} && cd ${EXTRACT_DIR} && ${EXTRACT_CMD};		\
)

pre-extract:

post-extract:
