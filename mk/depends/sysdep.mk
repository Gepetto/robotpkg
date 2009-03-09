# $LAAS: sysdep.mk 2009/03/09 23:33:39 tho $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
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
#                                      Anthony Mallet on Sun Mar  8 2009
#

_BOOTSTRAPDEPENDS_TARGETS= sysdep-depends
_BOOTSTRAPDEPENDS_TARGETS+= pkg-bootstrap-depends
_BOOTSTRAPDEPENDS_TARGETS+= bootstrap-depends-cookie

.PHONY: bootstrap-depends
ifeq (yes,$(call exists,${_COOKIE.bootstrapdepend}))
  bootstrap-depends:
	@${DO_NADA}
else
  $(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

  bootstrap-depends: ${_BOOTSTRAPDEPENDS_TARGETS}
endif


# Compute the prefix of packages that we are pulling from the system.
#
_PREFIXSEARCH_CMD=	${SETENV} ECHO=${ECHO}				\
				  TEST=${TEST}				\
				  SED=${SED}				\
				  AWK=${AWK}				\
				  PKG_ADMIN_CMD=${PKG_ADMIN_CMD}	\
			${SH} ${ROBOTPKG_DIR}/mk/depends/prefixsearch.sh


# --- sysdep-depends (PRIVATE) ---------------------------------------------
#
# sysdep-depends checks for any missing system dependencies. These
# dependencies are those listed in DEPEND_PKG with a PREFER.<pkg> set to
# 'system' or 'auto'.
#
sysdep-depends:
	${RUN}${MKDIR} $(dir ${_SYSDEP_FILE});				\
	>${_SYSDEP_FILE}.dlist; exec >>${_SYSDEP_FILE}.dlist;		\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter robotpkg,${PREFER.${_pkg_}}),,				\
	${ECHO} ${_pkg_};						\
	${ECHO} '${DEPEND_DIR.${_pkg_}}';				\
	${ECHO} "'${DEPEND_ABI.${_pkg_}}'";				\
	${ECHO} "$(call quote,${SYSTEM_SEARCH.${_pkg_}})";		\
	${ECHO} "'$(or ${PREFIX.${_pkg_}},${SYSTEM_PREFIX})'";		\
	${ECHO} $(call quote,${SYSTEM_DESCR.${_pkg_}});			\
	${ECHO} '$(if ${SYSTEM_PKG.${OPSYS}-${OPSUBSYS}.${_pkg_}},	\
		${OPSUBSYS},${OPSYS})';					\
	${ECHO} '$(or ${SYSTEM_PKG.${OPSYS}-${OPSUBSYS}.${_pkg_}},	\
		${SYSTEM_PKG.${OPSYS}.${_pkg_}})';			\
  )									\
)
	${RUN}>${_SYSDEP_FILE}; exec 0<${_SYSDEP_FILE}.dlist;		\
	while read pkg; do						\
	  read dir; read abi; read search; read path; read name;	\
	  read sys; read syspkg;					\
	  eval ${_PREFIXSEARCH_CMD} -p "$$path" "$$pkg" "$$abi"		\
		$$search >>${_SYSDEP_FILE} || {				\
	    ${RM} ${_SYSDEP_FILE};					\
	    ${ERROR_MSG} ${hline};					\
	    ${ERROR_MSG} "Scanning system for $$abi:";			\
	    eval ${_PREFIXSEARCH_CMD} -e				\
		-p "$$path" "$$pkg" "$$abi" $$search | ${ERROR_CAT};	\
	    ${ERROR_MSG};						\
	    ${ERROR_MSG} "${bf}Missing system package required for"	\
		"${PKGNAME}:${rm}";					\
	    if test -n "$$name"; then					\
	      ${ERROR_MSG} "		${bf}$$name${rm}";		\
	    else							\
	      ${ERROR_MSG} "		${bf}$$abi${rm}";		\
	    fi;								\
	    ${ERROR_MSG};						\
	    if test $$syspkg; then					\
	      ${ERROR_MSG}						\
		"${bf}Please install the $$sys package:${rm}";		\
	      ${ERROR_MSG} "		${bf}$$syspkg${rm}";		\
	    else							\
	      ${ERROR_MSG}						\
		"${bf}Please install it before continuing.${rm}";	\
	    fi;								\
	    ${ERROR_MSG};						\
	    ${ERROR_MSG} "If this package is installed in a"		\
		"non-standard location, you have";			\
	    ${ERROR_MSG} "to modify the SYSTEM_PREFIX or PREFIX.$$pkg"	\
		"variables in";						\
	    ${ERROR_MSG} "${MAKECONF}";					\
	    if test $$dir; then						\
	      ${ERROR_MSG};						\
	      ${ERROR_MSG} "If no $$abi package can be made available"	\
		"in your";						\
	      ${ERROR_MSG} "system, you can use the robotpkg version,"	\
		"by setting in";					\
	      ${ERROR_MSG} "${MAKECONF}:";				\
	      ${ERROR_MSG} "		PREFER.$$pkg=	robotpkg";	\
	    fi;								\
	    ${ERROR_MSG} ${hline};					\
	    exit 2;							\
	  };								\
	  $(if $(call isyes,${SYSDEP_VERBOSE}),				\
	    ${STEP_MSG} "Required system package $$abi found";		\
	  )								\
	done


# Include the file with system prefixes
#
ifdef _PKGSRC_BARRIER
  -include ${_SYSDEP_FILE}
endif
