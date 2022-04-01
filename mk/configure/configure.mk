#
# Copyright (c) 2006-2013,2022 LAAS/CNRS
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

$(call require, ${ROBOTPKG_DIR}/mk/configure/configure-vars.mk)

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

ifneq (,$(call isyes,${GNU_CONFIGURE}))
  include ${ROBOTPKG_DIR}/mk/configure/gnu-configure.mk
endif
ifneq (,$(call isyes,${USE_CMAKE}))
  include ${ROBOTPKG_DIR}/mk/configure/cmake-configure.mk
endif
ifneq (,$(call isyes,${USE_QMAKE}))
  include ${ROBOTPKG_DIR}/mk/configure/qmake-configure.mk
endif

CONFIGURE_SCRIPT?=	./configure
CONFIGURE_ENV+=		${ALL_ENV}
CONFIGURE_ARGS+=	${CONFIGURE_EXTRA_ARGS} # from cmdline
BUILD_DEFS+=		CONFIGURE_ARGS

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
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/extract/extract-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/patch/patch-vars.mk)

_CONFIGURE_TARGETS+=	$(call add-barrier, depends, configure)
ifndef _EXTRACT_IS_CHECKOUT
  _CONFIGURE_TARGETS+=	patch
endif
_CONFIGURE_TARGETS+=	acquire-configure-lock
_CONFIGURE_TARGETS+=	${_COOKIE.configure}
_CONFIGURE_TARGETS+=	release-configure-lock

.PHONY: configure
configure: ${_CONFIGURE_TARGETS};


.PHONY: acquire-configure-lock release-configure-lock
acquire-configure-lock: acquire-lock
release-configure-lock: release-lock


# --- configure-cookie (PRIVATE) -------------------------------------------
#
# ${_COOKIE.configure} creates the "configure" cookie file.
#
ifeq (yes,$(call exists,${_COOKIE.configure}))
  ifneq (,$(filter configure,${MAKECMDGOALS}))
    ${_COOKIE.configure}: .FORCE
  endif

  _MAKEFILE_WITH_RECIPES+=${_COOKIE.configure}
  ${_COOKIE.configure}: ${_COOKIE.depends}
	${RUN}${TEST} ! -f $@ || ${MV} -f $@ $@.prev

  _cbbh_requires+=	${_COOKIE.configure}
else
  ifeq (yes,$(call exists,${_COOKIE.depends}))
    ${_COOKIE.configure}: maybe-defer-configure real-configure;

    # This defers the configure target until an outdated depends has completed.
    # See mk/depend.mk for a more detailed explanation.
    .PHONY: maybe-defer-configure
    maybe-defer-configure: ${_COOKIE.depends}
	@${TEST} -f $<
  else
    # This defers the configure target until depends has completed and
    # make has restarted with those dependencies resolved.
    ${_COOKIE.configure}:;
  endif
endif

.PHONY: configure-cookie
configure-cookie: makedirs
	${RUN}${TEST} ! -f ${_COOKIE.configure} || ${FALSE}
	${RUN}exec >>${_COOKIE.configure};				\
	${ECHO} "_COOKIE.configure.date:=`${_CDATE_CMD}`"


# --- real-configure (PRIVATE) ---------------------------------------------
#
# real-configure is a helper target onto which one can hook all of the targets
# that do the actual configuration of the sources.
#
# Note: pre-configure-checks-hook comes after pre-configure to allow packages
# for fixing bad files with SUBST_STAGE.* = pre-configure.
#
ifdef NO_CONFIGURE
  _REAL_CONFIGURE_TARGETS+=	configure-cookie
else
  _REAL_CONFIGURE_TARGETS+=	configure-check-interactive
  _REAL_CONFIGURE_TARGETS+=	configure-message
  _REAL_CONFIGURE_TARGETS+=	pre-configure
  _REAL_CONFIGURE_TARGETS+=	do-configure-pre-hook
  _REAL_CONFIGURE_TARGETS+=	configure-check-dirs
  _REAL_CONFIGURE_TARGETS+=	do-configure
  _REAL_CONFIGURE_TARGETS+=	do-configure-post-hook
  _REAL_CONFIGURE_TARGETS+=	post-configure
  _REAL_CONFIGURE_TARGETS+=	configure-cookie
  ifneq (,$(filter configure,${MAKECMDGOALS}))
    _REAL_CONFIGURE_TARGETS+=	configure-done-message
  endif
endif

.PHONY: real-configure
real-configure: ${_REAL_CONFIGURE_TARGETS};

.PHONY: configure-message
configure-message:
	@if ${TEST} -f "${_COOKIE.configure}.prev"; then		\
	  ${PHASE_MSG} "Reconfiguring for ${PKGNAME}";			\
	else								\
	  ${PHASE_MSG} "Configuring for ${PKGNAME}";			\
	fi
	${RUN}								\
	${ECHO} "--- Environment ---" >${CONFIGURE_LOGFILE};		\
	${SETENV} >>${CONFIGURE_LOGFILE};				\
	${ECHO} "---" >>${CONFIGURE_LOGFILE}


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
	@${ERROR_MSG} "    \"cd ${CURDIR} && ${MAKE} configure\""
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
	${RUN}								\
  $(foreach _,${CONFIGURE_DIRS},					\
	{ cd ${WRKSRC} && cd "$_" 1>/dev/null 2>&1; } || {		\
	  ${ERROR_MSG} "${hline}";					\
	  ${ERROR_MSG} "$${bf}The configure directory of ${PKGNAME}"	\
		"could not be found$${rm}:";				\
	  ${ERROR_MSG} "	$_";					\
	  ${ERROR_MSG} "";						\
	  ${ERROR_MSG} "This should be reported to"			\
		"$(or ${MAINTAINER},the package maintainer).";		\
	  ${ERROR_MSG} "${hline}";					\
	  exit 2;							\
	};)


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
_CONFIGURE_SCRIPT_ENV+=	${CONFIGURE_ENV}

.PHONY: do-configure-script()
do-configure-script(%): .FORCE
	${RUN}								\
	cd ${WRKSRC} && cd '$%' &&					\
	${SETENV} ${_CONFIGURE_SCRIPT_ENV}				\
	  ${CONFIG_SHELL} ${CONFIGURE_SCRIPT}				\
	  ${CONFIGURE_ARGS} ${CONFIGURE_ARGS.$%}


# --- pre-configure, do-configure, post-configure (PUBLIC, override) -------
#
# {pre,do,post}-configure are the heart of the package-customizable configure
# targets, and may be overridden within a package Makefile.
#
ifdef HAS_CONFIGURE
  DO_CONFIGURE_TARGET?= do-configure-script(${CONFIGURE_DIRS})
endif

pre-configure do-configure post-configure: SHELL=${CONFIGURE_LOGFILTER}
pre-configure do-configure post-configure: .SHELLFLAGS=--

do%configure: ${DO_CONFIGURE_TARGET}
	${_OVERRIDE_TARGET}

.PHONY: pre-configure post-configure
pre-configure:

post-configure:
