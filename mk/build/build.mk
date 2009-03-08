# $LAAS: build.mk 2009/03/07 19:47:19 tho $
#
# Copyright (c) 2006-2009 LAAS/CNRS
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
#
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
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
# From $NetBSD: build.mk,v 1.9 2006/11/09 02:53:15 rillig Exp $
#
#                                       Anthony Mallet on Set Dec  2 2006
#

# This file defines what happens in the build phase, excluding the
# self-test, which is defined in test.mk.
#
# Package-settable variables:
#
# BUILD_MAKE_FLAGS is the list of arguments that is passed to the make
#	process, in addition to the usual MAKE_FLAGS.
#
# BUILD_TARGET is the target from ${MAKE_FILE} that should be invoked
#	to build the sources.
#
# Variables defined in this file:
#
# BUILD_MAKE_CMD
#	This command sets the proper environment for the build phase
#	and runs make(1) on it. It takes a list of make targets and
#	flags as argument.
#

$(call require, ${ROBOTPKG_DIR}/mk/compiler/compiler-vars.mk)


BUILD_MAKE_FLAGS?=	# none
BUILD_TARGET?=		all
$(foreach _d,${BUILD_DIRS},$(eval BUILD_TARGET.${_d}?= ${BUILD_TARGET}))

BUILD_MAKE_CMD=\
	${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${_MAKE_JOBS}	\
		${MAKE_FLAGS} ${BUILD_MAKE_FLAGS} -f ${MAKE_FILE}


# --- build (PUBLIC) -------------------------------------------------
#
# build is a public target to build the sources from the package.
#
_BUILD_TARGETS+=	configure
_BUILD_TARGETS+=	acquire-build-lock
_BUILD_TARGETS+=	${_COOKIE.build}
_BUILD_TARGETS+=	release-build-lock
#_BUILD_TARGETS+=	pkginstall

.PHONY: build
ifeq (yes,$(call exists,${_COOKIE.build}))
build:
	@${DO_NADA}
else
  $(call require, ${ROBOTPKG_DIR}/mk/internal/barrier.mk)
  $(call require, ${ROBOTPKG_DIR}/mk/configure/configure-vars.mk)

  ifdef _PKGSRC_BARRIER
build: ${_BUILD_TARGETS}
  else
build: barrier
  endif
endif

.PHONY: acquire-build-lock release-build-lock
acquire-build-lock: acquire-lock
release-build-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.build}))
${_COOKIE.build}:;
else
${_COOKIE.build}: real-build;
endif


# --- real-build (PRIVATE) -------------------------------------------
#
# real-build is a helper target onto which one can hook all of the
# targets that do the actual building of the sources.
#
_REAL_BUILD_TARGETS+=	build-check-interactive
_REAL_BUILD_TARGETS+=	build-message
_REAL_BUILD_TARGETS+=	build-check-dirs
#_REAL_BUILD_TARGETS+=	build-vars
#_REAL_BUILD_TARGETS+=	pre-build-checks-hook
_REAL_BUILD_TARGETS+=	pre-build
_REAL_BUILD_TARGETS+=	do-build
_REAL_BUILD_TARGETS+=	post-build
_REAL_BUILD_TARGETS+=	build-cookie

.PHONY: real-build
real-build: ${_REAL_BUILD_TARGETS}

.PHONY: build-message
build-message:
	@${PHASE_MSG} "Building for ${PKGNAME}"


# --- build-check-interactive (PRIVATE) ------------------------------
#
# build-check-interactive checks whether we must do an interactive
# build or not.
#
build-check-interactive:
ifdef BATCH
 ifneq (,$(filter build,${INTERACTIVE_STAGE}))
	@${ERROR_MSG} "The build stage of this package requires user interaction"
	@${ERROR_MSG} "Please build manually with:"
	@${ERROR_MSG} "    \"cd ${.CURDIR} && ${MAKE} build\""
	@${TOUCH} ${_INTERACTIVE_COOKIE}
	@${FALSE}
 else
	@${DO_NADA}
 endif
else
	@${DO_NADA}
endif


# --- build-check-dirs (PRIVATE) -------------------------------------
#
# build-check-dirs checks whether the build directories exist.
#
build-check-dirs:
	${_PKG_SILENT}${_PKG_DEBUG}					\
${foreach _dir_,$(BUILD_DIRS),						\
	if (cd $(WRKSRC) && cd $(_dir_)) 1>/dev/null 2>&1; then :; else	\
	$(ERROR_MSG) "The build directory of $(PKGNAME) cannot be found.";\
	$(ERROR_MSG) "Perhaps a stale work directory?";			\
	$(ERROR_MSG) "Try to";						\
	$(ERROR_MSG) "	${MAKE} clean in $(PKGPATH)"; 			\
	exit 2;								\
	fi;								\
}


# --- pre-build, do-build, post-build (PUBLIC, override) -------------
#
# {pre,do,post}-build are the heart of the package-customizable
# build targets, and may be overridden within a package Makefile.
#

do%build: .FORCE
	${_OVERRIDE_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _dir_,${BUILD_DIRS},						\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${BUILD_MAKE_CMD} ${BUILD_TARGET.${_dir_}};			\
)

.PHONY: pre-build post-build
pre-build:

post-build:


# --- build-clean (PRIVATE) ------------------------------------------------
#
# build-clean removes the state files for the "build" and later phases so that
# the "build" target may be re-invoked.
#
$(call require, ${ROBOTPKG_DIR}/mk/install/install-vars.mk)

build-clean: install-clean
	${RUN}${RM} -f ${_COOKIE.build}
