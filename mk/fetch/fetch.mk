#
# Copyright (c) 2006-2011 LAAS/CNRS
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#   3. All  advertising  materials  mentioning  features or  use of  this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: fetch.mk,v 1.23 2006/11/25 21:33:39 jdolecek Exp $
#
#					Anthony Mallet on Tue Dec  5 2006
#
ALLFILES?=	$(sort ${DISTFILES} ${PATCHFILES})
CKSUMFILES?=	$(filter-out ${IGNOREFILES},${ALLFILES})

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
_ALLFILES=	$(filter-out ${NOFETCHFILES}, 				\
			$(sort ${_DISTFILES} ${_PATCHFILES}))

BUILD_DEFS+=	DISTFILES PATCHFILES

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
define _FETCHFILE_VAR
SITES.$(subst =,--,$(notdir ${fetchfile}))?= ${MASTER_SITES}
endef
$(foreach fetchfile,${_DISTFILES},$(eval ${_FETCHFILE_VAR}))

define _PATCHFILES_VAR
SITES.$(subst =,--,$(notdir ${fetchfile}))?= ${PATCH_SITES}
endef
$(foreach fetchfile,${_PATCHFILES},$(eval ${_PATCHFILES_VAR}))


# depend on the proper fetch tool if required, and always on tnftp for
# MASTER_SITE_BACKUP
ifeq (,$(filter fetch,${INTERACTIVE_STAGE}))
  ifneq ($(words $(wildcard $(addprefix ${DISTDIR}/,${_ALLFILES}))),\
	 $(words ${_ALLFILES}))
    $(call require,${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
    include $(addprefix ${ROBOTPKG_DIR}/, ${_FETCH_DEPEND})
    DEPEND_METHOD.tnftp+=	bootstrap
    include ${ROBOTPKG_DIR}/pkgtools/tnftp/depend.mk
  endif
endif


# --- fetch (PUBLIC) -------------------------------------------------
#
# fetch is a public target to fetch all of the package distribution
# files.
#
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

_FETCH_TARGETS+=	$(call add-barrier, bootstrap-depends, fetch)
_FETCH_TARGETS+=	pre-fetch
_FETCH_TARGETS+=	do-fetch
_FETCH_TARGETS+=	post-fetch

.PHONY: fetch
fetch: ${_FETCH_TARGETS};


# --- pre-fetch, do-fetch, post-fetch (PUBLIC, override) -------------
#
# {pre,do,post}-fetch are the heart of the package-customizable
# fetch targets, and may be overridden within a package Makefile.
#

do%fetch: do-fetch-file .FORCE
	${_OVERRIDE_TARGET}
	@${DO_NADA}

.PHONY: pre-fetch post-fetch

pre-fetch:

post-fetch:

.PHONY: do-fetch-file
do-fetch-file: $(addprefix ${DISTDIR}/,${_ALLFILES})


# --- fetch-check-interactive (PRIVATE) ------------------------------
#
# fetch-check-interactive is a macro target that is inserted at the
# head of a target's command list, and will check whether the fetch
# stage for this package requires user interaction to proceed.
#
ifneq (,$(filter fetch,${INTERACTIVE_STAGE}))
$(addprefix ${DISTDIR}/,${_ALLFILES}):
  ifndef FETCH_MESSAGE
	@${TEST} ! -f $@ || exit 0;					\
	${ERROR_MSG} ${hline}; 						\
	${ERROR_MSG} ""; 						\
	${ERROR_MSG} "The fetch stage of this package requires user"	\
		"interaction to download"; 				\
	${ERROR_MSG} "the distfiles.  Please fetch the distfiles"	\
		"manually and place them in:"; 				\
	${ERROR_MSG} "    ${_DISTDIR}";					\
	${ERROR_MSG} ""; 						\
	${ERROR_MSG} ${hline}; 						\
	if ${TEST} -n ${MASTER_SITES}""; then				\
		${ERROR_MSG} "The distfiles are available from:";	\
		for site in ${MASTER_SITES}; do				\
			${ERROR_MSG} "    $$site";			\
		done;							\
	fi;								\
	if ${TEST} -n ${HOMEPAGE}""; then				\
		${ERROR_MSG} "See the following URL for more details:";	\
		${ERROR_MSG} "    "${HOMEPAGE};				\
	fi;								\
	exit 1
  else
	@${TEST} ! -f $@ || exit 0;					\
	${ERROR_MSG} ${hline}; 						\
	${ERROR_MSG} "";						\
	for line in ${FETCH_MESSAGE}; do ${ERROR_MSG} "$$line"; done;	\
	${ERROR_MSG} "";						\
	${ERROR_MSG} ${hline};						\
	exit 1
  endif
endif


# --- do-fetch-file (PRIVATE) ----------------------------------------
#
# do-fetch-file is a macro target that runs the "fetch" script to
# transfer the files from the appropriate sites if needed.
#
#
$(call require, ${ROBOTPKG_DIR}/mk/checksum/checksum-vars.mk)

_FETCH_ENV=\
	CP=${CP} ECHO=${ECHO} MV=$(call quote,${MV})			\
	TEST=$(call quote,${TEST}) MKDIR=$(call quote,${MKDIR})		\
	TOUCH=$(call quote,${TOUCH}) WC=$(call quote,${WC})		\
	FIND=$(call quote,${FIND}) SORT=$(call quote,${SORT})		\
	CHECKSUM=$(call quote,${_CHECKSUM_CMD})

_FETCH_SCRIPT=${FETCH_LOGFILTER} ${SETENV} ${_FETCH_ENV}		\
	FETCH_CMD=$(call quote,${_FETCH_CMD}) 				\
	FETCH_BEFORE_ARGS=$(call quote,${_FETCH_BEFORE_ARGS})		\
	FETCH_AFTER_ARGS=$(call quote,${_FETCH_AFTER_ARGS})		\
	FETCH_RESUME_ARGS=$(call quote,${_FETCH_RESUME_ARGS})		\
	FETCH_OUTPUT_ARGS=$(call quote,${_FETCH_OUTPUT_ARGS})		\
	${SH} ${ROBOTPKG_DIR}/mk/fetch/fetch

_FETCH_SCRIPT_BACKUP=${FETCH_LOGFILTER} ${SETENV} ${_FETCH_ENV}		\
	FETCH_CMD=${TNFTP} FETCH_BEFORE_ARGS=-R FETCH_OUTPUT_ARGS=-o	\
	${SH} ${ROBOTPKG_DIR}/mk/fetch/fetch

_FETCH_ARGS+=	-e $(patsubst %${EXTRACT_SUFX},%,$(notdir $@))
ifdef PKG_VERBOSE
  _FETCH_ARGS+=	${PKG_VERBOSE}
endif
ifndef NO_CHECKSUM
  ifeq (yes,$(call exists,${DISTINFO_FILE}))
    _FETCH_ARGS+=-c -f $(call quote,${DISTINFO_FILE})
  endif
endif
ifeq (,${DIST_SUBDIR})
  _FETCH_ARGS+=	-d .
else
  _FETCH_ARGS+=	-d ${DIST_SUBDIR}
endif

ifeq (,$(filter fetch,${INTERACTIVE_STAGE}))
$(addprefix ${DISTDIR}/,${_ALLFILES}):
	@${STEP_MSG} "Fetching $(notdir $@)"
	${RUN}${MKDIR} $(dir $@);					\
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
	done;								\
	unsorted_sites="${SITES.$(subst =,--,$(notdir $@))}";		\
	cd ${DISTDIR} &&						\
	${_FETCH_SCRIPT} -m ${FETCH_METHOD} ${_FETCH_ARGS}		\
		$(notdir $@) ${_ORDERED_SITES} ||:;			\
	if ${TEST} ! -f $@; then					\
		${_FETCH_SCRIPT_BACKUP} -m archive ${_FETCH_ARGS}	\
			$(notdir $@) ${_MASTER_SITE_BACKUP} ||:;	\
	fi;								\
	if ${TEST} ! -f $@; then					\
		${ERROR_MSG} "Could not fetch the following file:";	\
		${ERROR_MSG} "    $(notdir $@)";			\
		${ERROR_MSG} "";					\
		${ERROR_MSG} "Please retrieve this file manually into:";\
		${ERROR_MSG} "    $(dir $@)";				\
		exit 1;							\
	fi
endif


# --- mirror-distfiles (PUBLIC) --------------------------------------

# mirror-distfiles is a public target that is mostly of use only to
# sites that wish to provide distfiles that others may fetch.  It
# only fetches distfiles that are freely re-distributable.
#
.PHONY: mirror-distfiles
ifdef NO_PUBLIC_SRC
mirror-distfiles:
	@${DO_NADA}
else
mirror-distfiles: fetch
endif
