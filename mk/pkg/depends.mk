#
# Copyright (c) 2006-2011 LAAS/CNRS
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
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
#   3. All  advertising  materials  mentioning  features or  use  of this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
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
# From $NetBSD: depends.mk,v 1.14 2006/10/09 08:57:39 joerg Exp $
#
#                                       Anthony Mallet on Thu Nov 30 2006
#

# -- pkg-depends-build-options ---------------------------------------------
#
# pkg-depends-build-options checks that required packages are or will be built
# with required options.
#
# This is done by fetching the PKG_OPTIONS that have been in effect when a
# package was built. When the package is not yet installed, the current
# PKG_OPTIONS for this package are queried.
#
override \
define _build_options_cmd
	pkg=`${_PKG_BEST_EXISTS} "$1" || ${TRUE}`;			\
	case "$$pkg" in							\
	"")	popts=`cd ${DEPEND_DIR.${_pkg_}} &&			\
		  ${RECURSIVE_MAKE} show-var VARNAME=PKG_OPTIONS ||:`;	\
		installed=no ;;						\
	*)	popts=`${PKG_INFO} -Q PKG_OPTIONS ${_pkg_} || :`;	\
		installed=yes ;;					\
	esac;								\
	for opt in ${REQD_BUILD_OPTIONS.$1}; do				\
	  ${ECHO} $$popts | ${GREP} $$opt 2>/dev/null 1>&2 || {		\
	    ${ERROR_MSG} ${hline};					\
	    ${ERROR_MSG} "$${bf}The package ${PKGNAME} requires the"	\
		"following option$${rm}";				\
	    ${ERROR_MSG} "$${bf}enabled in $1:$${rm}	$$opt";		\
	    ${ERROR_MSG} "";						\
	    if ${TEST} "$$installed" = "yes"; then			\
	      ${ERROR_MSG} "You must re-install $1 in"			\
			"${DEPEND_DIR.${_pkg_}}";			\
	      ${ERROR_MSG} "with this option enabled. It was built with"\
		"these options:";					\
	    else							\
	      ${ERROR_MSG} "You must add \`$$opt' to PKG_OPTIONS.$1 in";\
	      ${ERROR_MSG} "		${MAKECONF}";			\
	      ${ERROR_MSG} "The current options for $1 are:";		\
	    fi;								\
	    if test -n "$${popts}"; then				\
	      ${ERROR_MSG} "		$${popts}";			\
	    else							\
	      ${ERROR_MSG} "		(none)";			\
	    fi;								\
	    ${ERROR_MSG} ${hline};					\
	    exit 2;							\
	  };								\
	done
endef

.PHONY: pkg-depends-build-options
pkg-depends-build-options:
	${RUN}								\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(and $(strip ${REQD_BUILD_OPTIONS.${_pkg_}}),			\
		$(filter robotpkg,${PREFER.${_pkg_}})),			\
	$(call _build_options_cmd,${_pkg_});				\
  )									\
)


# --- pkg-sys-conflicts (PRIVATE, mk/depends/depends.mk) -------------------
#
# pkg-sys-conflict checks that system packages that can also be provided by
# robotpkg are not actually installed by robotpkg.
#
.PHONY: pkg-sys-conflicts
pkg-sys-conflicts:
	${RUN}conflicts=;						\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter robotpkg,${PREFER.${_pkg_}}),,				\
    $(if ${DEPEND_DIR.${_pkg_}},					\
	if ${PKG_INFO} -qe "${_pkg_}"; then				\
	  conflicts="$$conflicts ${_pkg_} $(patsubst			\
		${ROBOTPKG_DIR}/%,%,$(realpath				\
		${CURDIR}/${DEPEND_DIR.${_pkg_}}))";			\
	fi;								\
)))									\
	if ${TEST} -n "$$conflicts"; then				\
	  ${ERROR_MSG} "${hline}";					\
	  ${ERROR_MSG} "$${bf}The following packages should be"		\
		"managed externally, but they are$${rm}";		\
	  ${ERROR_MSG} "$${bf}still installed by robotpkg:$${rm}";	\
	  ${ERROR_MSG} "";						\
	  set -- $$conflicts; while ${TEST} $$# -gt 0; do		\
	    ${ERROR_MSG} "		`${PKG_INFO} -e "$$1"` in $$2";	\
	    shift 2;							\
	  done;								\
	  ${ERROR_MSG} "";						\
	  ${ERROR_MSG} "Please use \`${MAKE} deinstall\` to deinstall"	\
		"the packages above or";				\
	  ${ERROR_MSG} "update your settings in";			\
	  ${ERROR_MSG} "	${MAKECONF}";				\
	  ${ERROR_MSG} "by adding:";					\
	  set -- $$conflicts; while ${TEST} $$# -gt 0; do		\
	    ${ERROR_MSG} "		PREFER.$$1 = robotpkg";		\
	    shift 2;							\
	  done;								\
	  ${ERROR_MSG} "${hline}";					\
	  exit 2;							\
	fi


# --- pkg-depends-file (PRIVATE) -------------------------------------------
#
# pkg-depends-file creates the robotpkg prefixes file.
#
.PHONY: pkg-depends-file
pkg-depends-file:
	${RUN}${MKDIR} $(dir ${_PKGDEP_FILE});				\
	>${_PKGDEP_FILE}; exec 3>>${_PKGDEP_FILE};			\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter robotpkg,${PREFER.${_pkg_}}),				\
	prefix=`${PKG_INFO} -qp ${_pkg_} | ${SED} -e 's|^[^/]*||;q'`;	\
	${_PREFIXSEARCH_CMD} -p "$$prefix" 				\
		"${_pkg_}" "${DEPEND_ABI.${_pkg_}}"			\
		$(or ${SYSTEM_SEARCH.${_pkg_}}, "") >/dev/null 2>&1 || {\
		${ERROR_MSG} "${hline}";				\
		${ERROR_MSG} "$${bf}A package matching"			\
			"\`${DEPEND_ABI.${_pkg_}}'$${rm}";		\
		${ERROR_MSG} "$${bf}should be installed but some files"	\
			"are missing.$${rm}";				\
		${ERROR_MSG} "";					\
		${_PREFIXSEARCH_CMD} -v -p "$$prefix" "${_pkg_}" 	\
		  "${DEPEND_ABI.${_pkg_}}"				\
		   $(or ${SYSTEM_SEARCH.${_pkg_}},"") |			\
			${AWK} '/^missing:/ {print $$2}' | ${ERROR_CAT};\
		${ERROR_MSG} "";					\
		${ERROR_MSG} "Please reinstall the package in"		\
			"${DEPEND_DIR.${_pkg_}}";			\
		${ERROR_MSG} "${hline}";				\
		exit 2;							\
	};								\
  )									\
)



# --- pkg-depends-install (PRIVATE, mk/depends/depends.mk) -----------
#
# pkg-depends-install installs any missing dependencies.
#
.PHONY: pkg-depends-install
pkg-depends-install:
	${RUN}silent=; { :;						\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter robotpkg,${PREFER.${_pkg_}}),				\
      $(if $(filter bootstrap,${DEPEND_METHOD.${_pkg_}}),,		\
	${ECHO} '${DEPEND_ABI.${_pkg_}}' '${DEPEND_DIR.${_pkg_}}';	\
  )))									\
	} | while read pattern dir; do					\
	  ${_DEPENDS_INSTALL_CMD};					\
	done


# --- pkg-bootstrap-depends (PRIVATE, pkgsrc/mk/depends/bootstrap.mk) ------

# pkg-bootstrap-depends installs any missing robotpkg dependencies needed
# during stages before the normal "depends" stage.  These dependencies are
# package listed with DEPEND_METHOD.pkg set to bootstrap.
#
.PHONY: pkg-bootstrap-depends
pkg-bootstrap-depends:
	${RUN} >${_PKGBSDEP_FILE};					\
	silent=${_BOOTSTRAP_VERBOSE};					\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter robotpkg,${PREFER.${_pkg_}}),				\
      $(if $(filter bootstrap,${DEPEND_METHOD.${_pkg_}}),		\
	pattern="${DEPEND_ABI.${_pkg_}}";				\
	dir="${DEPEND_DIR.${_pkg_}}";					\
	${_DEPENDS_INSTALL_CMD};					\
	prefix=`${PKG_INFO} -qp "${_pkg_}" | ${SED} -e 's|^[^/]*||;q'`;	\
	${_PREFIXSEARCH_CMD} -p "$$prefix" "${_pkg_}" 			\
	  "$$pattern" $(or ${SYSTEM_SEARCH.${_pkg_}},"")		\
	    >/dev/null 2>&1 3>>${_PKGBSDEP_FILE} || {			\
		${ERROR_MSG} "${hline}";				\
		${ERROR_MSG} "$${bf}A package matching"			\
			"\`$$pattern'$${rm}";				\
		${ERROR_MSG} "$${bf}is installed but some files are"	\
			"missing:$${rm}";				\
		${ERROR_MSG} "";					\
		${_PREFIXSEARCH_CMD} -v -p "$$prefix" "${_pkg_}" 	\
		  "$$pattern" $(or ${SYSTEM_SEARCH.${_pkg_}},"") |	\
			${AWK} '/^missing:/ {print $$2}' | ${ERROR_CAT};\
		${ERROR_MSG} "";					\
		${ERROR_MSG} "Please reinstall the package in $$dir";	\
		${ERROR_MSG} "${hline}";				\
		exit 2;							\
	};								\
      )									\
    )									\
  )

# _DEPENDS_INSTALL_CMD expects "$pattern" to hold the dependency pattern
#	and "$dir" to hold the package directory path associated with
#	that dependency pattern.
#
_DEPENDS_INSTALL_CMD=							\
	best=`${_PKG_BEST_EXISTS} "$$pattern" || ${TRUE}`;		\
	case "$$best" in						\
	"")								\
		${STEP_MSG} "Required installed package $$pattern:"	\
			"NOT found";					\
		target=${DEPENDS_TARGET};				\
		${STEP_MSG} "Verifying $$target for $$dir";		\
		if ${TEST} ! -d "$$dir"; then				\
			${ERROR_MSG} "The directory \`$$dir' does not"	\
				"exist.";				\
			exit 1;						\
		fi;							\
		cd $$dir;						\
		${SETENV} ${PKGSRC_MAKE_ENV}				\
			PKGNAME_REQD="$$pattern"			\
			${MAKE} _AUTOMATIC=yes $$target;		\
		best=`${_PKG_BEST_EXISTS} "$$pattern" || ${TRUE}`;	\
		case "$$best" in					\
		"")	${ERROR_MSG} "A package matching \`$$pattern'"	\
				" should";				\
			${ERROR_MSG} "be installed, but one cannot be"	\
				"found.  Perhaps there is a";		\
			${ERROR_MSG} "stale work directory for $$dir?"; \
			${ERROR_MSG} "Try to ${MAKE} clean in $$dir.";	\
			exit 1;						\
		esac;							\
		${STEP_MSG} "Returning to build of ${PKGNAME}";		\
		;;							\
	*)								\
		if ${TEST} -z "$$silent"; then				\
			${STEP_MSG} "Required robotpkg package"		\
				"$$pattern: $$best found";		\
		fi;							\
		;;							\
	esac
