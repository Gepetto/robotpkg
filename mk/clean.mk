#
# Copyright (c) 2006,2009-2010 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: bsd.pkg.clean.mk,v 1.9 2006/10/09 11:44:06 joerg Exp $
#
#                                      Anthony Mallet on Thu Nov 30 2006
#

# This Makefile fragment is included to robotpkg.mk and defines the
# relevant variables and targets for the "clean" phase.
#
# The following variables may be set by the package Makefile and
# specify how cleaning happens:
#
#    CLEANDEPENDS specifies the whether "cleaning" will also clean
#	in all dependencies, implied and direct.  CLEANDEPENDS
#	defaults to "no".
#
# The following targets are defined by bsd.pkg.clean.mk:
#
#    clean-depends is the target which descends into dependencies'
#	package directories and invokes the "clean" action.
#
#    do-clean is the target that does the actual cleaning, which
#	involves removing the work directory and other temporary
#	files used by the package.
#
#    clean is the target that is invoked by the user to perform
#	the "clean" action.
#
#    cleandir is an alias for "clean".
#

CLEANDEPENDS?=	no

.PHONY: clean-depends
clean-depends:
	${RUN}${_DEPENDS_WALK_CMD} ${PKGPATH} |		\
	while read dir; do				\
	  cd ${ROBOTPKG_DIR}/$$dir &&			\
	  ${RECURSIVE_MAKE} CLEANDEPENDS=no clean ||:;	\
	done

.PHONY: pre-clean
pre-clean:

.PHONY: post-clean
post-clean:

.PHONY: do-clean
ifneq (,$(call isyes,${MAKE_SUDO_INSTALL}))
  _SU_TARGETS+=	do-clean
  do-clean: su-target-do-clean
  su-do-clean:
else
  do-clean:
endif
	${RUN}dirs="$(realpath ${WRKDIR}				\
		$(if ${WRKOBJDIR},${BUILD_DIR} ${WRKDIR_BASENAME}))";	\
	for dir in $$dirs; do						\
	  if ! ${TEST} -e "$$dir"; then continue; fi;			\
	  if ${TEST} -w "$$dir"; then					\
	    ${RM} -rf $$dir;						\
	  else								\
	    ${STEP_MSG} $$dir" not writable, skipping"; 		\
	  fi;								\
        done


# --- clean-confirm-checkout -----------------------------------------------
#
# clean-confirm-checkout asks for confirmation before cleaning a checked out
# work directory.
#
$(call require,${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)

ifneq (,$(call isyes,${_EXTRACT_IS_CHECKOUT}))
  .PHONY: clean-confirm-checkout
  clean-confirm-checkout:
	@${ERROR_MSG} ${hline};							\
	${ERROR_MSG} "$${bf}A checkout is present in the build directory$${rm}"	\
		"of ${PKGBASE}.";						\
	${ERROR_MSG} "";							\
	${ERROR_MSG} "You must confirm the cleaning action by doing";		\
	${ERROR_MSG} "		\`$${bf}${MAKE} clean confirm$${rm}' in"	\
		"${PKGPATH}";							\
	${ERROR_MSG} ${hline};							\
	${FALSE}

  ifeq  (,$(filter confirm,${MAKECMDGOALS}))
    _CLEAN_TARGETS+=	clean-confirm-checkout
  endif
endif


# --- clean-confirm-update -------------------------------------------------
#
# clean-confirm-update asks for confirmation before cleaning a work directory
# in the middle of an update.
#
$(call require,${ROBOTPKG_DIR}/mk/update/update-vars.mk)

ifeq (yes,$(call exists,${_UPDATE_LIST}))
  .PHONY: clean-confirm-update
  clean-confirm-update:
	@${ERROR_MSG} ${hline};						\
	${ERROR_MSG} "$${bf}An update is in progress for"		\
		"${PKGPATH}$${rm}";					\
	if ${TEST} -s ${_UPDATE_LIST}; then				\
	  ${ERROR_MSG} "The following packages are still to be"		\
		"updated:";						\
	  while read dir pkg; do					\
		${ERROR_MSG} "		$$pkg in $$dir";		\
	  done <${_UPDATE_LIST};					\
	fi;								\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "You must confirm the cleaning action by doing";	\
	${ERROR_MSG} "		'$${bf}${MAKE} clean confirm$${rm}' in"	\
		"${PKGPATH}";						\
	${ERROR_MSG} ${hline};						\
	${FALSE}

  ifeq  (,$(filter confirm,${MAKECMDGOALS}))
    _CLEAN_TARGETS+=	clean-confirm-update
  endif
endif


# --- clean ----------------------------------------------------------------
#
#    clean is the target that is invoked by the user to perform
#	the "clean" action.
_CLEAN_TARGETS+=	clean-message
_CLEAN_TARGETS+=	pre-clean
ifneq (,$(call isyes,CLEANDEPENDS))
  _CLEAN_TARGETS+=	clean-depends
endif
_CLEAN_TARGETS+=	do-clean
_CLEAN_TARGETS+=	post-clean

.PHONY: clean
clean: ${_CLEAN_TARGETS}

.PHONY: cleaner
ifneq (,$(call isyes,${_EXTRACT_IS_CHECKOUT}))
  $(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

  cleaner: clean-message pre-clean depends-clean post-clean
else
  cleaner: clean
endif

.PHONY: clean-message
clean-message:
ifneq (,$(wildcard ${WRKDIR} $(if ${WRKOBJDIR},${BUILD_DIR} ${WRKDIR_BASENAME})))
	@${PHASE_MSG} "Cleaning temporary files for ${PKGNAME}"
else
	@${DO_NADA}
endif
