#
# Copyright (c) 2006-2011,2013 LAAS/CNRS
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
$(call require, ${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk)

# depend on the proper fetch tool, and always on tnftp for MASTER_SITE_BACKUP
ifneq (0,$(words ${_ALLFILES}))
  DEPEND_METHOD.tnftp+=	bootstrap
  include \
    $(addprefix ${ROBOTPKG_DIR}/,${_FETCH_DEPEND} pkgtools/tnftp/depend.mk)
endif


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


# --- fetch (PUBLIC) -------------------------------------------------
#
# fetch is a public target to fetch all of the package distribution
# files.
#
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

ifneq (,$(foreach _,${_FETCH_ONLY},$(if $(wildcard ${DISTDIR}/$_),,no)))
  _FETCH_TARGETS+=	$(call add-barrier, bootstrap-depends, fetch)
  _FETCH_TARGETS+=	pre-fetch
  _FETCH_TARGETS+=	do-fetch
  _FETCH_TARGETS+=	post-fetch
endif

.PHONY: fetch
fetch: ${_FETCH_TARGETS}; @:

ifneq (,$(foreach _,${_ALLFILES},$(if $(wildcard ${DISTDIR}/$_),,no)))
  _FETCH_ALL_TARGETS+=	$(call add-barrier, bootstrap-depends, fetch)
  _FETCH_ALL_TARGETS+=	pre-fetch
  _FETCH_ALL_TARGETS+=	do-fetch-all-file
  _FETCH_ALL_TARGETS+=	post-fetch
endif

.PHONY: fetch-all
fetch-all: ${_FETCH_ALL_TARGETS}; @:


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


# --- do-fetch-file (PRIVATE) ----------------------------------------
#
# do-fetch-file is a macro target that runs the "fetch" script to
# transfer the files from the appropriate sites if needed.
#
#
$(call require, ${ROBOTPKG_DIR}/mk/checksum/checksum-vars.mk)

.PHONY: do-fetch-file
do-fetch-file: $(addprefix ${DISTDIR}/,${_FETCH_ONLY})

.PHONY: do-fetch-all-file
do-fetch-all-file: $(addprefix ${DISTDIR}/,${_ALLFILES})

_FETCH_ENV=\
	CP=${CP} ECHO=${ECHO} MV=$(call quote,${MV})			\
	TEST=$(call quote,${TEST}) MKDIR=$(call quote,${MKDIR})		\
	TOUCH=$(call quote,${TOUCH}) WC=$(call quote,${WC})		\
	FIND=$(call quote,${FIND}) SORT=$(call quote,${SORT})		\
	CHECKSUM=$(call quote,${_CHECKSUM_CMD})

_FETCH_SCRIPT=${FETCH_LOGFILTER} ${SETENV} ${_FETCH_ENV}		\
	FETCH_CMD=$(call quote,${_FETCH_CMD})				\
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
    ifeq (,$(filter mdi distinfo makesum,${MAKECMDGOALS}))
      _FETCH_ARGS+=-c -f $(call quote,${DISTINFO_FILE})
    endif
  endif
endif
_FETCH_ARGS+=  -d $(or $(strip ${DIST_SUBDIR}),.)

$(addprefix ${DISTDIR}/,${_ALLFILES}):
	${RUN} distfile='$(patsubst ${DISTDIR}/%,%,$@)';		\
	${STEP_MSG} "Fetching $$distfile";				\
	${MKDIR} $(dir $@) && ${RM} $@;					\
	for d in "" $(subst :, ,${DIST_PATH}); do			\
	  case $$d in ""|${DISTDIR}) continue ;; esac;			\
	  if ! cd "$$d" 2>/dev/null; then continue; fi;			\
	  if ${TEST} -f "$$distfile"; then				\
  $(if ${NO_CHECKSUM},,							\
    $(if $(filter yes,$(call exists,${DISTINFO_FILE})),			\
	    ${ECHO} "Checking $$d/$$distfile";				\
	    ${_CHECKSUM_CMD} '${DISTINFO_FILE}' "$$distfile"|| continue;\
    ))									\
	    ${ECHO} "Using $$d/$$distfile";				\
	    ${LN} -s "$$d/$$distfile" $@;				\
	    exit 0;							\
	  fi;								\
	done
  ifeq (,$(filter fetch,${INTERACTIVE_STAGE}))
	${RUN} ${TEST} ! -f $@ || exit 0;				\
	distfile='$(patsubst ${DISTDIR}/%,%,$@)';			\
	unsorted_sites='${SITES.$(notdir $@)}';				\
	${MKDIR} ${WRKDIR}/.fetch && cd ${WRKDIR}/.fetch;		\
	${_FETCH_SCRIPT} -m ${FETCH_METHOD} ${_FETCH_ARGS}		\
		"$(notdir $@)" ${_ORDERED_SITES} ||:;			\
	if ${TEST} ! -f "$$distfile"; then				\
	  ${_FETCH_SCRIPT_BACKUP} -m archive ${_FETCH_ARGS}		\
			"$(notdir $@)" ${_MASTER_SITE_BACKUP} ||:;	\
	fi;								\
	if ${TEST} ! -f "$$distfile"; then				\
	  ${ERROR_MSG} "Could not fetch the following file:";		\
	  ${ERROR_MSG} "    $(notdir $@)";				\
	  ${ERROR_MSG} "";						\
	  ${ERROR_MSG} "Please retrieve this file manually into:";	\
	  ${ERROR_MSG} "    $(dir $@)";					\
	  exit 1;							\
	fi;								\
	${MV} -f "$$distfile" "$@"
  else # INTERACTIVE_STAGE
	${RUN} ${TEST} ! -f $@ || exit 0;				\
	${ERROR_MSG} ${hline};						\
	for line in ${FETCH_MESSAGE}; do ${ERROR_MSG} "$$line"; done;	\
	${ERROR_MSG} "";						\
	${ERROR_MSG} ${hline};						\
	exit 1
  endif
