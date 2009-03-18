# $LAAS: depends.mk 2009/03/18 23:07:52 tho $
#
# Copyright (c) 2006-2009 LAAS/CNRS
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

_DEPENDS_FILE=		${WRKDIR}/.depends
_REDUCE_DEPENDS_CMD=	${SETENV} CAT=${CAT}				\
				PKG_ADMIN=${PKG_ADMIN_CMD}		\
				PWD_CMD=${PWD_CMD} TEST=${TEST}		\
			${AWK} -f ${ROBOTPKG_DIR}/mk/pkg/reduce-depends.awk

# This command prints out the dependency patterns for all full (run-time)
# dependencies of the package.
#
_DEPENDS_PATTERNS_CMD=	\
	if ${TEST} -f ${_COOKIE.depends}; then				\
		${CAT} ${_COOKIE.depends} |				\
		${AWK} '/^full/ { print $$2 } { next }';		\
	fi

# --- pkg-depends-cookie (PRIVATE, mk/depends/depends.mk) ------------
#
# depends-cookie creates the "depends" cookie file.
#
# The "depends" cookie file contains all of the dependency information
# for the package.  The format of each line of the cookie file is:
#
#    <depends_type>	<pattern>	<directory>
#
# Valid dependency types are "build" and "full".
#
.PHONY: pkg-depends-cookie
pkg-depends-cookie: ${_DEPENDS_FILE}
	${RUN}${TEST} ! -f ${_COOKIE.depends} || ${FALSE}
	${RUN}${MKDIR} $(dir ${_COOKIE.depends})
	${RUN}${MV} -f ${_DEPENDS_FILE} ${_COOKIE.depends}

${_DEPENDS_FILE}:
	${RUN} ${MKDIR} $(dir $@)
	${RUN} ${_REDUCE_DEPENDS_CMD} $(call quote,${BUILD_DEPENDS}) > $@.tmp
	${RUN} exec 0< $@.tmp;						\
	while read dep; do						\
		pattern=`${ECHO} $$dep | ${SED} -e "s,:.*,,"`;		\
		dir=`${ECHO} $$dep | ${SED} -e "s,.*:,,"`;		\
		${TEST} -n "$$pattern" || exit 1;			\
		${TEST} -n "$$dir" || exit 1;				\
		${ECHO} "build	$$pattern	$$dir";			\
	done >> $@
	${RUN} ${_REDUCE_DEPENDS_CMD} $(call quote,${DEPENDS}) > $@.tmp
	${RUN} exec 0< $@.tmp;						\
	while read dep; do						\
		pattern=`${ECHO} $$dep | ${SED} -e "s,:.*,,"`;		\
		dir=`${ECHO} $$dep | ${SED} -e "s,.*:,,"`;		\
		${TEST} -n "$$pattern" || exit 1;			\
		${TEST} -n "$$dir" || exit 1;				\
		${ECHO} "full	$$pattern	$$dir";			\
	done >> $@


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
	    ${ERROR_MSG} "${bf}The package ${PKGNAME} requires the"	\
		"following option${rm}";				\
	    ${ERROR_MSG} "${bf}enabled in $1:${rm}	$$opt";		\
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


# --- pkg-depends-file (PRIVATE) -------------------------------------------
#
# pkg-depends-file creates the robotpkg prefixes file.
#
.PHONE: pkg-depends-file
pkg-depends-file: export hline:=${hline}
pkg-depends-file: export bf:=${bf}
pkg-depends-file: export rm:=${rm}
pkg-depends-file:
	${RUN}${MKDIR} $(dir ${_PKGDEP_FILE});				\
	>${_PKGDEP_FILE}; exec 1>/dev/null 3>>${_PKGDEP_FILE};		\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter robotpkg,${PREFER.${_pkg_}}),				\
	prefix=`${PKG_INFO} -qp ${_pkg_} | ${SED} -e 's|^[^/]*||;q'`;	\
	${_PREFIXSEARCH_CMD} -e -p "$$prefix" 				\
		-d $(or $(call quote,${SYSTEM_DESCR.${_pkg_}}),"")	\
		-n $(call quote,${PKGNAME})				\
		-t robotpkg						\
		"${_pkg_}" "${DEPEND_ABI.${_pkg_}}"			\
		$(or ${SYSTEM_SEARCH.${_pkg_}}, "");			\
  )									\
)



# --- pkg-depends-install (PRIVATE, mk/depends/depends.mk) -----------
#
# pkg-depends-install installs any missing dependencies.
#
.PHONY: pkg-depends-install
pkg-depends-install: ${_DEPENDS_FILE}
	${RUN}set -- dummy `${CAT} ${_DEPENDS_FILE}`; shift;		\
	while ${TEST} $$# -gt 0; do					\
		type="$$1"; pattern="$$2"; dir="$$3"; shift 3;		\
		silent=;						\
		${_DEPENDS_INSTALL_CMD};				\
	done


# --- pkg-bootstrap-depends (PUBLIC, pkgsrc/mk/depends/depends.mk) ---

# bootstrap-depends is a public target to install any missing
# dependencies needed during stages before the normal "depends"
# stage.  These dependencies are listed in BOOTSTRAP_DEPENDS.
#
.PHONY: pkg-bootstrap-depends
pkg-bootstrap-depends:
	${RUN}args=$(call quote,$(subst :, ,${BOOTSTRAP_DEPENDS}));	\
	set -- dummy $$args; shift;					\
	while ${TEST} $$# -gt 0; do					\
		pattern="$$1"; dir="$$2"; shift 2;			\
		silent=${_BOOTSTRAP_VERBOSE};				\
		${_DEPENDS_INSTALL_CMD};				\
	done

# _DEPENDS_INSTALL_CMD expects "$pattern" to hold the dependency pattern
#	and "$dir" to hold the package directory path associated with
#	that dependency pattern.
#
_DEPENDS_INSTALL_CMD=							\
	pkg=`${_PKG_BEST_EXISTS} "$$pattern" || ${TRUE}`;		\
	case "$$pkg" in							\
	"")								\
		${STEP_MSG} "Required installed package $$pattern: NOT found"; \
		target=${DEPENDS_TARGET};				\
		${STEP_MSG} "Verifying $$target for $$dir";		\
		if ${TEST} ! -d "$$dir"; then				\
			${ERROR_MSG} "[depends.mk] The directory \`\`$$dir'' does not exist."; \
			exit 1;						\
		fi;							\
		cd $$dir;						\
		${SETENV} ${PKGSRC_MAKE_ENV} _PKGSRC_DEPS=", ${PKGNAME}${_PKGSRC_DEPS}" PKGNAME_REQD="$$pattern" ${MAKE} _AUTOMATIC=yes $$target; 	\
		pkg=`${_PKG_BEST_EXISTS} "$$pattern" || ${TRUE}`;	\
		case "$$pkg" in						\
		"")	${ERROR_MSG} "[depends.mk] A package matching \`\`$$pattern'' should"; \
			${ERROR_MSG} "    be installed, but one cannot be found.  Perhaps there is a"; \
			${ERROR_MSG} "    stale work directory for $$dir?"; \
			${ERROR_MSG} "    Try to ${MAKE} clean in $$dir."; \
			exit 1;						\
		esac;							\
		${STEP_MSG} "Returning to build of ${PKGNAME}";		\
		;;							\
	*)								\
		if ${TEST} -z "$$silent"; then				\
			${STEP_MSG} "Required robotpkg package $$pattern: $$pkg found"; \
		fi;							\
		;;							\
	esac
