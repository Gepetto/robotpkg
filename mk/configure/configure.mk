# $LAAS: configure.mk 2009/10/27 16:24:13 mallet $
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
# From $NetBSD: configure.mk,v 1.12 2006/11/09 02:53:15 rillig Exp $
#
#					Anthony Mallet on Thu Dec  7 2006
#

#
# CONFIGURE_SCRIPT is the path to the script to run in order to
#	configure the software for building.  If the path is relative,
#	then it is assumed to be relative to each directory listed in
#	CONFIGURE_DIRS.
#
# CONFIGURE_ENV is the shell environment that is exported to the
#	configure script.
#
# CONFIGURE_ARGS is the list of arguments that is passed to the
#	configure script.
#

ifdef GNU_CONFIGURE
  include ${ROBOTPKG_DIR}/mk/configure/gnu-configure.mk
endif
ifdef USE_CMAKE
  include ${ROBOTPKG_DIR}/mk/configure/cmake-configure.mk
endif
ifdef USE_QMAKE
  include ${ROBOTPKG_DIR}/mk/configure/qmake-configure.mk
endif

CONFIGURE_SCRIPT?=	./configure
CONFIGURE_ENV+=		${ALL_ENV}
CONFIGURE_ARGS+=	${CONFIGURE_EXTRA_ARGS} # from cmdline
_BUILD_DEFS+=		CONFIGURE_ENV CONFIGURE_ARGS

#.if defined(OVERRIDE_GNU_CONFIG_SCRIPTS)
#.  include "${ROBOTPKG_DIR}/mk/configure/config-override.mk"
#.endif
#.include "${ROBOTPKG_DIR}/mk/configure/replace-interpreter.mk"
ifdef USE_PKGLOCALEDIR
  include ${ROBOTPKG_DIR}/mk/configure/replace-localedir.mk
endif


# --- configure (PUBLIC) ---------------------------------------------------
#
# configure is a public target to configure the sources for building.
#
$(call require, ${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)

ifndef _EXTRACT_IS_CHECKOUT
  _CONFIGURE_TARGETS+=	patch
endif
_CONFIGURE_TARGETS+=	acquire-configure-lock
_CONFIGURE_TARGETS+=	${_COOKIE.configure}
_CONFIGURE_TARGETS+=	release-configure-lock

.PHONY: configure
ifeq (yes,$(call exists,${_COOKIE.configure}))
configure:
	@${DO_NADA}
else
  $(call require, ${ROBOTPKG_DIR}/mk/compiler/compiler-vars.mk)
  ifndef _EXTRACT_IS_CHECKOUT
    $(call require, ${ROBOTPKG_DIR}/mk/patch/patch-vars.mk)
  endif

  configure: $(call barrier, depends, ${_CONFIGURE_TARGETS})
endif

.PHONY: acquire-configure-lock release-configure-lock
acquire-configure-lock: acquire-lock
release-configure-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.configure}))
  ${_COOKIE.configure}:;
else
  $(call require, ${ROBOTPKG_DIR}/mk/compiler/compiler-vars.mk)
  ${_COOKIE.configure}: real-configure;
endif


# --- real-configure (PRIVATE) ---------------------------------------------
#
# real-configure is a helper target onto which one can hook all of the targets
# that do the actual configuration of the sources.
#
# Note: pre-configure-checks-hook comes after pre-configure to allow packages
# for fixing bad files with SUBST_STAGE.* = pre-configure.
#
_REAL_CONFIGURE_TARGETS+=	configure-check-interactive
_REAL_CONFIGURE_TARGETS+=	configure-message
#_REAL_CONFIGURE_TARGETS+=	configure-vars
_REAL_CONFIGURE_TARGETS+=	pre-configure
#_REAL_CONFIGURE_TARGETS+=	pre-configure-checks-hook
_REAL_CONFIGURE_TARGETS+=	do-configure-pre-hook
_REAL_CONFIGURE_TARGETS+=	configure-check-dirs
_REAL_CONFIGURE_TARGETS+=	do-configure
_REAL_CONFIGURE_TARGETS+=	do-configure-post-hook
_REAL_CONFIGURE_TARGETS+=	post-configure
_REAL_CONFIGURE_TARGETS+=	configure-cookie

.PHONY: real-configure
real-configure: ${_REAL_CONFIGURE_TARGETS}

.PHONY: configure-message
configure-message:
	@${PHASE_MSG} "Configuring for ${PKGNAME}"


# --- configure-check-interactive (PRIVATE) --------------------------
#
# configure-check-interactive checks whether we must do an interactive
# configuration or not.
#
.PHONY: configure-check-interactive
configure-check-interactive:
ifdef BATCH
 ifneq (,$(filter configure,${INTERACTIVE_STAGE}))
	@${ERROR_MSG} "The configure stage of this package requires user interaction"
	@${ERROR_MSG} "Please configure manually with:"
	@${ERROR_MSG} "    \"cd ${.CURDIR} && ${MAKE} configure\""
	@${TOUCH} ${_INTERACTIVE_COOKIE}
	@${FALSE}
 else
	@${DO_NADA}
 endif
else
	@${DO_NADA}
endif


# --- configure-check-dirs (PRIVATE) ---------------------------------------
#
# configure-check-dirs checks whether the configure directories exist.
#
configure-check-dirs:
	${_PKG_SILENT}${_PKG_DEBUG}					\
${foreach _dir_,$(CONFIGURE_DIRS),					\
	if (cd $(WRKSRC) && cd $(_dir_)) 1>/dev/null 2>&1; then :; else	\
	$(ERROR_MSG) "The configure directory of $(PKGNAME) cannot be found.";\
	$(ERROR_MSG) "Perhaps a stale work directory?";			\
	$(ERROR_MSG) "Try to";						\
	$(ERROR_MSG) "	${MAKE} clean in $(PKGPATH)"; 			\
	exit 2;								\
	fi;								\
}


# --- do-configure-pre-hook (PRIVATE) --------------------------------------
#
# do-configure-pre-hook is a helper target onto which one can hook all of the
# targets that should be run after pre-configure but before do-configure.
# These targets typically edit the files used by the do-configure target.
#
.PHONY: do-configure-pre-hook
do-configure-pre-hook:


# --- do-configure-post-hook (PRIVATE) -------------------------------------
#
# do-configure-post-hook is a helper target onto which one can hook all of the
# targets that should be run after do-configure but before post-configure.
# These targets typically edit the files generated by the do-configure target
# that are used during the build phase.
#
.PHONY: do-configure-post-hook
do-configure-post-hook:


# --- do-configure-script (PRIVATE) ----------------------------------------
#
# do-configure-script runs the configure script to configure the software for
# building.
#
_CONFIGURE_SCRIPT_ENV+=	INSTALL=${INSTALL}\ -c\ -o\ ${BINOWN}\ -g\ ${BINGRP}
_CONFIGURE_SCRIPT_ENV+=	INSTALL_PROGRAM=$(call quote,${INSTALL_PROGRAM})
_CONFIGURE_SCRIPT_ENV+=	INSTALL_SCRIPT=$(call quote,${INSTALL_SCRIPT})
_CONFIGURE_SCRIPT_ENV+=	INSTALL_DATA=$(call quote,${INSTALL_DATA})
_CONFIGURE_SCRIPT_ENV+=	${CONFIGURE_ENV}

.PHONY: do-configure-script
do-configure-script:
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _dir_,${CONFIGURE_DIRS},					\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${SETENV} ${_CONFIGURE_SCRIPT_ENV}				\
		${CONFIG_SHELL} ${CONFIGURE_SCRIPT} ${CONFIGURE_ARGS};	\
)


# --- pre-configure, do-configure, post-configure (PUBLIC, override) -------
#
# {pre,do,post}-configure are the heart of the package-customizable configure
# targets, and may be overridden within a package Makefile.
#
ifdef HAS_CONFIGURE
_DO_CONFIGURE_TARGETS+=	do-configure-script
endif

do%configure: ${_DO_CONFIGURE_TARGETS} .FORCE
	${_OVERRIDE_TARGET}
	@${DO_NADA}

.PHONY: pre-configure post-configure
pre-configure:

post-configure:


# --- configure-clean (PRIVATE) --------------------------------------------
#
# configure-clean removes the state files for the "configure" and later phases
# so that the "configure" target may be re-invoked.
#
$(call require, ${ROBOTPKG_DIR}/mk/build/build-vars.mk)

configure-clean: build-clean
	${RUN}${RM} -f ${_COOKIE.configure}
