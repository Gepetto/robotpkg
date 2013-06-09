#
# Copyright (c) 2007-2013 LAAS/CNRS
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
# From $NetBSD: bsd.utils.mk,v 1.8 2006/07/27 22:01:28 jlam Exp $
#
#					Anthony Mallet on Wed May 16 2007
#

# This Makefile fragment is included by robotpkg.mk and defines utility
# and otherwise miscellaneous variables and targets.

# Used to print all the '===>' style prompts - override this to turn them off.
#
ECHO?=			echo
TEST?=			test
ifndef SILENT
  ECHO_MSG?=		${_SETFANCY_CMD}; ${ECHO}
else
  ECHO_MSG?=		:
endif
PHASE_MSG?=		_m() { ${ECHO_MSG} "$${bf}===> $$@$$rm"; }; _m
STEP_MSG?=		:;${ECHO_MSG} "=>"
WARNING_MSG?=		${ECHO_MSG} 1>&2 "WARNING:"
ERROR_MSG?=		${ECHO_MSG} 1>&2 "ERROR:"
FAIL_MSG?=		${FAIL} $(call quote,${ERROR_MSG})

WARNING_CAT?=		${SED} -e "s|^|WARNING: |" 1>&2
ERROR_CAT?=		${SED} -e "s|^|ERROR: |" 1>&2

_LOGFILTER?=\
	${SETENV} ECHO_N=$(call quote,${ECHO_N})	\
	${SH} ${ROBOTPKG_DIR}/mk/internal/logfilter


# Debugging levels, dependent on PKG_DEBUG_LEVEL definition
# 0 == normal, default, quiet operation
# 1 == all shell commands echoed before invocation
# 2 == shell "set -x" operation
PKG_DEBUG_LEVEL?=	0
_PKG_SILENT=		@
_PKG_DEBUG=#		empty
ifdef VERBOSE
  _LOGFILTER_FLAGS=	-v
else
  _LOGFILTER_FLAGS=#	empty
endif

ifeq (1,${PKG_DEBUG_LEVEL})
_PKG_SILENT=#		empty
_LOGFILTER_FLAGS=	-n
endif

ifeq (2,${PKG_DEBUG_LEVEL})
_PKG_SILENT=#		empty
_PKG_DEBUG=		set -x;
_LOGFILTER_FLAGS=	-n
endif

# Solaris has problems with the interactive ESC key reading...
ifneq (SunOS,${OPSYS})
  _LOGFILTER_FLAGS+=	-i
endif

# This variable can be prepended to all shell commands that should not
# be printed by default, but when PKGSRC_DEBUG_LEVEL is non-zero.
# It also adds error checking.
#
RUN=			${_PKG_SILENT}${_PKG_DEBUG} set -e;

# How to do nothing.  Override if you, for some strange reason, would rather
# do something.
DO_NADA?=		${TRUE}

# the FAIL command executes its arguments and then exits with a non-zero
# status.
FAIL?=                  ${SH} ${ROBOTPKG_DIR}/mk/internal/fail

# A temporary directory
#
TMPDIR?=	/tmp

# Printed dates should be agnostic regarding the locale.
#
_CDATE_CMD:=	${SETENV} LC_ALL=C ${DATE}

# Compute the date of this run. This is used to compute a consistent version
# for checkouts accross various recursive 'make' invocation.
#
ifndef _ROBOTPKG_NOW
  export _ROBOTPKG_NOW:=$(shell ${_CDATE_CMD} "+%Y%m%d%H%M%S")
  _ENV_VARS+=	_ROBOTPKG_NOW
endif

# Run ${MAKE} recursively.
RECURSIVE_MAKE=${MAKE}
MAKEFLAGS+=--no-print-directory

# Need to do this, don't know why this works but otherwise MAKEOVERRIDES is
# sometimes lost (gmake-3.82, see robotpkg commit 128793abe).
export MAKEOVERRIDES:=${MAKEOVERRIDES}


# --- fancy decorations ----------------------------------------------------
#
ifeq (undefined,$(origin bf))
  export bf:=$(shell ${TPUT} ${TPUT_BOLD} 2>/dev/null)
  _ENV_VARS+=bf
endif
ifeq (undefined,$(origin rm))
  export rm:=$(shell ${TPUT} ${TPUT_RMBOLD} 2>/dev/null)
  _ENV_VARS+=rm
endif
export hline:="$$bf$(subst =,=======,==========)$$rm"

_SETFANCY_CMD:=${TEST} -t 1 || { bf=; rm=; }


# --- makedirs -------------------------------------------------------------
#
# Create initial working directories
#
_COOKIE.wrkdir=	${WRKDIR}/.wrkdir_cookie

.PHONY: makedirs
makedirs: ${_COOKIE.wrkdir} ${PKG_DBDIR};

_MAKEFILE_WITH_RECIPES+=${_COOKIE.wrkdir}
${_COOKIE.wrkdir}:
	${RUN}${MKDIR} ${WRKDIR};					\
	exec >>${_COOKIE.wrkdir};					\
	${ECHO} "_COOKIE.wrkdir.date:=`${_CDATE_CMD}`";			\
	${ECHO} "_COOKIE.wrkdir.pkgversion:=${PKGVERSION_NOREV}";	\
	${ECHO} "_COOKIE.wrkdir.pkgoptions:=${PKG_OPTIONS}";		\
	alt='$(foreach _,${PKG_ALTERNATIVES},${PKG_ALTERNATIVE.$_})';	\
	${ECHO} "_COOKIE.wrkdir.alternatives:=$$alt"

${PKG_DBDIR}:
	${RUN}${MKDIR} ${PKG_DBDIR}


# --- %-done-message -------------------------------------------------------
#
# Print a message when a top-level target is done
%-done-message: .FORCE
	@${PHASE_MSG} "Done $* for ${PKGNAME}"


# --- confirm --------------------------------------------------------
#
# confirm is an empty target that is used to confirm other targets by
# doing `make target confirm'. It is the responsability of `target' to
# check that confirm was specified in the MAKECMDGOALS variable.
# If 'confirm' was the only target, do 'all' by default.
.PHONY: confirm
ifeq (confirm,${MAKECMDGOALS})
  MAKECMDGOALS+= all
  confirm: all
endif
confirm:
	@${DO_NADA}


# Fake target to make pattern targets phony
#
.PHONY: .FORCE
.FORCE:
