# $LAAS: utils.mk 2009/03/11 18:33:52 mallet $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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
ECHO_MSG?=		${ECHO}
PHASE_MSG?=		_bf() { ${ECHO_MSG} "${bf}===>" $$@ "${rm}"; }; _bf
STEP_MSG?=		${ECHO_MSG} "=>"
WARNING_MSG?=		${ECHO_MSG} 1>&2 "WARNING:"
ERROR_MSG?=		${ECHO_MSG} 1>&2 "ERROR:"
FAIL_MSG?=		${FAIL} ${ERROR_MSG}

WARNING_CAT?=		${SED} -e "s|^|WARNING: |" 1>&2
ERROR_CAT?=		${SED} -e "s|^|ERROR: |" 1>&2

# A temporary directory
#
TMPDIR?=	/tmp

# Printed dates should be agnostic regarding the locale
#
_CDATE_CMD:=	${SETENV} LC_ALL=C ${DATE}


# --- interactive ----------------------------------------------------
#
# Determine whether the current `make' has intearctive input and output
#
_INTERACTIVE_STDIN=	${TMPDIR}/.robotpkg_interactive_stdin
_INTERACTIVE_STDOUT=	${TMPDIR}/.robotpkg_interactive_stdout

.PHONY: interactive
interactive:
	@if ${TEST} -t 0; then				\
		${TOUCH} ${_INTERACTIVE_STDIN} ||:;	\
	else						\
		${RM} ${_INTERACTIVE_STDIN};		\
	fi;						\
	if ${TEST} -t 1; then				\
		${TOUCH} ${_INTERACTIVE_STDOUT} ||:;	\
	else						\
		${RM} ${_INTERACTIVE_STDOUT};		\
	fi;						\


# --- Fancy decorations ----------------------------------------------
#
bf:=`${TEST} -f ${_INTERACTIVE_STDOUT} && ${TPUT} ${TPUT_BOLD} 2>/dev/null ||:`
rm:=`${TEST} -f ${_INTERACTIVE_STDOUT} && ${TPUT} ${TPUT_RMBOLD} 2>/dev/null ||:`
hline:="${bf}$(subst =,=======,==========)${rm}"


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
.PHONY: show-var
show-var:
	@${ECHO} '$(subst ','\'',${${VARNAME}})' #'

# enhanced version of target above, to display multiple variables
.PHONY: show-vars
show-vars:
	@:; $(foreach VARNAME,${VARNAMES},${ECHO} '$(subst ','\'',${${VARNAME}})';) #'


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
DEPENDS_TYPE?=  all
ifneq (,$(strip $(filter build all,${DEPENDS_TYPE})))
_ALL_DEPENDS+=	${BOOTSTRAP_DEPENDS} ${BUILD_DEPENDS}
endif
ifneq (,$(strip $(filter install package all,${DEPENDS_TYPE})))
_ALL_DEPENDS+=	${DEPENDS}
endif

.PHONY: show-depends
show-depends:
	@$(foreach _pkg_,${_ALL_DEPENDS},				\
		${ECHO} '$(subst :,	,${_pkg_})';)
	@${DO_NADA}

.PHONY: show-depends-pkgpaths
show-depends-pkgpaths:
	@for d in							\
		$(sort $(subst ${ROBOTPKG_DIR}/,,$(realpath $(foreach	\
			_d_,${_ALL_DEPENDS},				\
			$(word 2,$(subst :, ,${_d_})))))); do		\
		${ECHO} $$d;						\
	done


# --- confirm --------------------------------------------------------
#
# confirm is an empty target that is used to confirm other targets by
# doing `make target confirm'. It is the responsability of `target' to
# check that confirm was specified in the MAKECMDGOALS variable.
#
.PHONY: confirm
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
