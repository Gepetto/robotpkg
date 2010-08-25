#
# Copyright (c) 2006-2010 LAAS/CNRS
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

_MASTER_SITE_BACKUP=	${MASTER_SITE_BACKUP:=${DIST_SUBDIR:=/}}
_MASTER_SITE_OVERRIDE=	${MASTER_SITE_OVERRIDE:=${DIST_SUBDIR:=/}}

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
define _FETCHFILE_VAR
SITES.$(subst =,--,$(notdir ${fetchfile}))?= ${MASTER_SITES}
endef
$(foreach fetchfile,${_DISTFILES},$(eval ${_FETCHFILE_VAR}))

define _PATCHFILES_VAR
SITES.$(subst =,--,$(notdir ${fetchfile}))?= ${PATCH_SITES}
endef
$(foreach fetchfile,${_PATCHFILES},$(eval ${_PATCHFILES_VAR}))


# XXX require pkgtools/tnftp, although the fetch program is configurable
ifeq (,$(filter fetch,${INTERACTIVE_STAGE}))
  ifneq ($(words $(wildcard $(addprefix ${DISTDIR}/,${_ALLFILES}))),\
	 $(words ${_ALLFILES}))
    DEPEND_METHOD.tnftp+=	bootstrap
    include ${ROBOTPKG_DIR}/pkgtools/tnftp/depend.mk
  endif
endif


# --- fetch (PUBLIC) -------------------------------------------------
#
# fetch is a public target to fetch all of the package distribution
# files.
#
$(call require, ${ROBOTPKG_DIR}/mk/internal/barrier.mk)
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

_FETCH_TARGETS+=	pre-fetch
_FETCH_TARGETS+=	do-fetch
_FETCH_TARGETS+=	post-fetch

.PHONY: fetch
fetch: $(call barrier, bootstrap-depends, ${_FETCH_TARGETS})


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

_FETCH_BEFORE_ARGS.tnftp=	# empty
_FETCH_AFTER_ARGS.tnftp=	# empty
_FETCH_RESUME_ARGS.tnftp=	-R
_FETCH_OUTPUT_ARGS.tnftp=	-o

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
		${SH} ${ROBOTPKG_DIR}/mk/fetch/fetch

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

ifeq (,$(filter fetch,${INTERACTIVE_STAGE}))
$(addprefix ${DISTDIR}/,${_ALLFILES}):
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
