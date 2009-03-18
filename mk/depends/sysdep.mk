# $LAAS: sysdep.mk 2009/03/20 11:41:55 mallet $
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

# Compute the prefix of packages that we are pulling from the system.
#
_PREFIXSEARCH_CMD=\
	${SETENV} ECHO=${ECHO}					\
		  TEST=${TEST}					\
		  SED=${SED}					\
		  AWK=${AWK}					\
		  PKG_ADMIN_CMD=$(call quote,${PKG_ADMIN_CMD})	\
		  MAKECONF=$(call quote,${MAKECONF})		\
	${SH} ${ROBOTPKG_DIR}/mk/depends/prefixsearch.sh


# --- sysdep-depends (PRIVATE) ---------------------------------------------
#
# sysdep-depends checks for any missing system dependencies. These
# dependencies are those listed in DEPEND_PKG with a PREFER.<pkg> set to
# 'system' or 'auto'.
#
.PHONY: sysdep-depends
sysdep-depends: export hline:=${hline}
sysdep-depends: export bf:=${bf}
sysdep-depends: export rm:=${rm}
sysdep-depends:
	${RUN}${MKDIR} $(dir ${_SYSDEP_FILE}); >${_SYSDEP_FILE};	\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter robotpkg,${PREFER.${_pkg_}}),,				\
	found=`${_PREFIXSEARCH_CMD} -e	 				\
	     -p $(call quote,$(or ${PREFIX.${_pkg_}},${SYSTEM_PREFIX}))	\
	     -n $(call quote,${PKGNAME})				\
	     -d $(or $(call quote,${SYSTEM_DESCR.${_pkg_}}),"")		\
	     -s $(or $(call quote,$(strip				\
		  $(or ${SYSTEM_PKG.${OPSYS}-${OPSUBSYS}.${_pkg_}},	\
		  ${SYSTEM_PKG.${OPSYS}.${_pkg_}}))),"")		\
	     -o $(call quote,$(strip					\
		  $(if ${SYSTEM_PKG.${OPSYS}-${OPSUBSYS}.${_pkg_}},	\
		  ${OPSUBSYS},${OPSYS})))				\
	     -r $(or ${DEPEND_DIR.${_pkg_}},"")				\
	     -t	system							\
		$(call quote,${_pkg_})					\
		$(call quote,${DEPEND_ABI.${_pkg_}})			\
		${SYSTEM_SEARCH.${_pkg_}} 3>>${_SYSDEP_FILE}`		\
	$(if $(call isyes,${SYSDEP_VERBOSE}), &&			\
	   ${STEP_MSG} "Required system package ${DEPEND_ABI.${_pkg_}}:"\
		"$$found found")					\
	|| { ${RM} ${_SYSDEP_FILE}; exit 2; };				\
  )									\
)
