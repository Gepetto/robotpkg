#
# Copyright (c) 2007-2010 LAAS/CNRS
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
STEP_MSG?=		${ECHO_MSG} "=>"
WARNING_MSG?=		${ECHO_MSG} 1>&2 "WARNING:"
ERROR_MSG?=		${ECHO_MSG} 1>&2 "ERROR:"
FAIL_MSG?=		${FAIL} $(call quote,${ERROR_MSG})

WARNING_CAT?=		${SED} -e "s|^|WARNING: |" 1>&2
ERROR_CAT?=		${SED} -e "s|^|ERROR: |" 1>&2

_LOGFILTER?=\
	${SETENV} ECHO_N=$(call quote,${ECHO_N})		\
	${SH} ${ROBOTPKG_DIR}/mk/internal/logfilter


# Debugging levels, dependent on PKG_DEBUG_LEVEL definition
# 0 == normal, default, quiet operation
# 1 == all shell commands echoed before invocation
# 2 == shell "set -x" operation
PKG_DEBUG_LEVEL?=	0
_PKG_SILENT=		@
_PKG_DEBUG=#		empty
_PKG_DEBUG_SCRIPT=#	empty
_PKG_DISCARD_STDERR=	2>/dev/null
ifdef VERBOSE
  _LOGFILTER_FLAGS=	-n
else
  _LOGFILTER_FLAGS=#	empty
endif

ifeq (1,${PKG_DEBUG_LEVEL})
_PKG_SILENT=#		empty
_PKG_DISCARD_STDERR=#	empty
_LOGFILTER_FLAGS=	-v
endif

ifeq (2,${PKG_DEBUG_LEVEL})
_PKG_SILENT=#		empty
_PKG_DEBUG=		set -x;
_PKG_DEBUG_SCRIPT=	${SH} -x
_PKG_DISCARD_STDERR=#	empty
_LOGFILTER_FLAGS=	-n
endif

# Solaris has problems with the interactive ESC key reading...
ifneq (SunOS,${OPSYS})
  _LOGFILTER_FLAGS+=	-i
endif


# A temporary directory
#
TMPDIR?=	/tmp

# Printed dates should be agnostic regarding the locale
#
_CDATE_CMD:=	${SETENV} LC_ALL=C ${DATE}

# This variable can be prepended to all shell commands that should not
# be printed by default, but when PKGSRC_DEBUG_LEVEL is non-zero.
# It also adds error checking.
#
RUN=			${_PKG_SILENT}${_PKG_DEBUG} set -e;


# --- fancy decorations ----------------------------------------------------
#
export bf:=$(shell ${TPUT} ${TPUT_BOLD} 2>/dev/null)
export rm:=$(shell ${TPUT} ${TPUT_RMBOLD} 2>/dev/null)
export hline:="$$bf$(subst =,=======,==========)$$rm"

_SETFANCY_CMD:=${TEST} -t 1 || { bf=; rm=; }


# --- makedirs -------------------------------------------------------
#
# Create initial working directories
#
.PHONY: makedirs
makedirs: ${WRKDIR}

${WRKDIR}:
	${RUN}${MKDIR} ${WRKDIR}


# --- show-var -------------------------------------------------------------
#
# convenience target, to display make variables from command line
# i.e. "make show-var VARNAME=var", will print var's value
#
$(call require-for, show-var show-vars,				\
	$(if $(findstring PKG_, ${VARNAME} ${VARNAMES}),	\
		${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk))

.PHONY: show-var
show-var: export _value=${${VARNAME}}
show-var:
	@${ECHO} "$$_value"

# enhanced version of target above, to display multiple variables
.PHONY: show-vars
show-vars:
	@:; $(foreach _v_,${VARNAMES},\
		${RECURSIVE_MAKE} show-var VARNAME=${_v_};)


# --- show-comment ---------------------------------------------------------
#
# print value of the COMMENT variable
#
.PHONY: show-comment
show-comment:
	@if [ $(call quote,${COMMENT})"" ]; then			\
		${ECHO} $(call quote,${COMMENT});			\
	elif [ -f COMMENT ] ; then					\
		${CAT} COMMENT;						\
	else								\
		${ECHO} '(no description)';				\
	fi


# --- show-license ---------------------------------------------------------
#
# browse the file pointed to by the LICENSE variable
#
LICENSE_FILE?=		${ROBOTPKG_DIR}/licenses/${LICENSE}

.PHONY: show-license
show-license:
	@license=${LICENSE};						\
	license_file=${LICENSE_FILE};					\
	pager=${PAGER}	;						\
	case "$$pager" in "") pager=${CAT};; esac;			\
	case "$$license" in "") exit 0;; esac;				\
	if ${TEST} -f "$$license_file"; then				\
		$$pager "$$license_file";				\
	else								\
		${ECHO} "Generic $$license information not available";	\
		${ECHO} "See the package description (pkg_info -d ${PKGNAME}) for more information."; \
	fi


# --- show-depends-pkgpaths ------------------------------------------------
#
# DEPENDS_TYPE is used by the "show-depends-pkgpaths" target and specifies
# which class of dependencies to output.  The special value "all" means
# to output every dependency.
#
$(call require-for, show-depends show-depends-pkgpaths,			\
	${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

DEPENDS_TYPE?=  all
_DEPENDS_TYPE=
ifneq (,$(strip $(filter build all,${DEPENDS_TYPE})))
  _DEPENDS_TYPE+=	bootstrap build
endif
ifneq (,$(strip $(filter install package all,${DEPENDS_TYPE})))
  _DEPENDS_TYPE+=	full
endif

.PHONY: show-depends
show-depends:
	${RUN}{								\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter ${_DEPENDS_TYPE},${DEPEND_METHOD.${_pkg_}}),		\
		${ECHO} '${DEPEND_ABI.${_pkg_}}	${DEPEND_DIR.${_pkg_}}';\
    )									\
  )									\
	} | ${SORT}

.PHONY: show-depends-pkgpaths
show-depends-pkgpaths:
	${RUN}								\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter ${_DEPENDS_TYPE},${DEPEND_METHOD.${_pkg_}}),		\
      $(if ${DEPEND_DIR.${_pkg_}},					\
	${ECHO} $(subst ${ROBOTPKG_DIR}/,,$(realpath			\
		${DEPEND_DIR.${_pkg_}}));				\
      )									\
    )									\
  )


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


# _DEPENDS_WALK_CMD holds the command (sans arguments) to walk the
# dependency graph for a package.
#
_DEPENDS_WALK_MAKEFLAGS?=	$(call quote,${MAKEFLAGS})
_DEPENDS_WALK_CMD=							\
	${SETENV} ECHO=${TOOLS_ECHO} MAKE=${MAKE}			\
		MAKEFLAGS=${_DEPENDS_WALK_MAKEFLAGS}			\
		ROBOTPKG_DIR=${ROBOTPKG_DIR} TEST=${TOOLS_TEST}		\
	${AWK} -f ${ROBOTPKG_DIR}/mk/internal/depends-depth-first.awk --

# Fake target to make pattern targets phony
#
.PHONY: .FORCE
.FORCE:
