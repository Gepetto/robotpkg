#
# Copyright (c) 2018 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Wed Apr 11 2018
#

# This file defines how to clear the build phase.
#
# Package-settable variables:
#
# CLEAN_MAKE_FLAGS is the list of arguments that is passed to the make
#	process, in addition to the usual MAKE_FLAGS.
#
# CLEAN_TARGET is the target from ${MAKE_FILE} that should be invoked
#	to clean the sources.
#
# Variables defined in this file:
#
# CLEAN_MAKE_CMD
#	This command sets the proper environment for the build phase
#	and runs make(1) on it. It takes a list of make targets and
#	flags as argument.
#

$(call require, ${ROBOTPKG_DIR}/mk/build/build-vars.mk)


# --- clean-build (PRIVATE) ------------------------------------------------
#
# clean-build is a target to clean the built sources of the package.
#
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

_CLEAN_BUILD_TARGETS+=	$(call add-barrier, depends, clean-build)
_CLEAN_BUILD_TARGETS+=	configure
_CLEAN_BUILD_TARGETS+=	acquire-clean-build-lock
_CLEAN_BUILD_TARGETS+=	clean-build-message
_CLEAN_BUILD_TARGETS+=	do-clean-build
_CLEAN_BUILD_TARGETS+=	clean-build-cookie
_CLEAN_BUILD_TARGETS+=	release-clean-build-lock

.PHONY: clean-build
ifeq (yes,$(call exists,${_COOKIE.build}))
  $(call require, ${ROBOTPKG_DIR}/mk/configure/configure.mk)

  cleaner: $(call add-barrier, depends, cleaner) clean-build
  clean-build: ${_CLEAN_BUILD_TARGETS};
else
  cleaner clean-build:
	@${DO_NADA}
endif

.PHONY: acquire-clean-build-lock release-clean-build-lock
acquire-clean-build-lock: acquire-lock
release-clean-build-lock: release-lock


.PHONY: clean-build-message
clean-build-message:
	@${PHASE_MSG} "Running clean for ${PKGNAME}"
	${RUN}								\
	${ECHO} "--- Environment ---" >${BUILD_LOGFILE};		\
	${SETENV} >>${BUILD_LOGFILE};					\
	${ECHO} "---" >>${BUILD_LOGFILE}


# --- clean-build-cookie (PRIVATE) -----------------------------------------
#
# clean-build-cookie removes the ${_COOKIE.build} cookie file.
#
.PHONY: clean-build-cookie
clean-build-cookie:
	${RUN}${RM} -f ${_COOKIE.build}


# --- do-clean-build (PUBLIC, override) ------------------------------------
#
# do-clean-build is the heart of the package-customizable clean target
#

do-clean-build: SHELL=${BUILD_LOGFILTER}
do-clean-build: .SHELLFLAGS=--

do%clean-build: .FORCE
	${_OVERRIDE_TARGET}
	${RUN}								\
$(foreach _dir_,${BUILD_DIRS},						\
	cd ${WRKSRC} && cd ${_dir_} && $(call CLEAN_MAKE_CMD,${_dir_});	\
)
