#
# Copyright (c) 2009-2011 LAAS/CNRS
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


.PHONY: sys-depends
sys-depends:
	$(call sys-resolve, build full, ${_SYSDEP_FILE})

.PHONY: sys-bootstrap-depends
sys-bootstrap-depends:
	$(call sys-resolve, bootstrap, ${_SYSBSDEP_FILE})


# --- sys-resolve (PRIVATE) ------------------------------------------------
#
# sys-resolve checks for any missing system dependencies. These
# dependencies are those listed in DEPEND_PKG with a PREFER.<pkg> set to
# 'system' or 'auto'.
#
override define sys-resolve
	${RUN}${MKDIR} $(dir ${_SYSDEP_FILE}); >$2; >${_SYSDEP_LOG}	\
	notfound=; syspkg=;						\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter robotpkg,${PREFER.${_pkg_}}),,				\
    $(if $(filter $1,${DEPEND_METHOD.${_pkg_}}),			\
	found=`${_PREFIXSEARCH_CMD} 2>>${_SYSDEP_LOG} -e	 	\
	     -p $(call quote,$(or ${PREFIX.${_pkg_}},${SYSTEM_PREFIX}))	\
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
		${SYSTEM_SEARCH.${_pkg_}} 3>>$2` || found=;		\
	if ${TEST} -z "$$found"; then					\
	  notfound="$$notfound|"$(call quote,$(strip			\
	    $(or ${SYSTEM_DESCR.${_pkg_}},${DEPEND_ABI.${_pkg_}})));	\
	  syspkg="$$syspkg|"$(call quote,$(strip			\
	    $(or ${SYSTEM_PKG.${OPSYS}-${OPSUBSYS}.${_pkg_}},		\
	         ${SYSTEM_PKG.${OPSYS}.${_pkg_}},:)));			\
	else								\
	  $(if $(call isyes,${SYSDEP_VERBOSE}),				\
	   ${STEP_MSG} "Required system package ${DEPEND_ABI.${_pkg_}}:"\
		"$$found found",:);					\
	fi;								\
    )))									\
	if ${TEST} -n "$$notfound"; then				\
	  ${ERROR_MSG} ${hline};					\
	  ${ERROR_MSG} "$${bf}Missing system packages required for"	\
		"${PKGNAME}:$${rm}";					\
	  ${ERROR_MSG};							\
	  IFS='|'; set -- $$syspkg; for p in $$notfound; do		\
	    if ${TEST} -z "$$1" -a -z "$$p"; then shift; continue; fi;	\
	    if ${TEST} "$$1" = ":"; then				\
	      s=;							\
	    else							\
	      s="	("$(call quote,$(strip				\
		  $(or ${OPSUBSYS},${OPSYS})))" package $$1)";		\
	    fi;								\
	    ${ERROR_MSG} "	$${bf}$$p$${rm}$$s";			\
	    shift ||:;							\
	  done; unset IFS;						\
	  ${ERROR_MSG};							\
	  ${ERROR_MSG} "Please use the system package management tool"	\
		"to install these";					\
	  ${ERROR_MSG} "dependencies. If a robotpkg version of a"	\
		"dependency is available,";				\
	  ${ERROR_MSG} "you can configure robotpkg.conf to use this"	\
		"version instead.";					\
	  ${ERROR_MSG};							\
	  ${ERROR_MSG} "See ${_SYSDEP_LOG} for details.";		\
	  ${ERROR_MSG} ${hline};					\
	  ${RM} -f ${_SYSDEP_FILE};					\
	  exit 2;							\
	else								\
	  if ${TEST} -s ${_SYSDEP_LOG}; then				\
	    ${WARNING_CAT} <${_SYSDEP_LOG};				\
	  fi;								\
	fi
endef
