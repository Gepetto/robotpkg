#
# Copyright (c) 2006-2012 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
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
# From $NetBSD: install.mk,v 1.8 2006/07/07 21:24:28 jlam Exp $
#
#                                      Anthony Mallet on Wed Nov  8 2006
#

# --- install-check-conflicts (PRIVATE, mk/install/install.mk) -------
#
# install-check-conflicts checks for conflicts between the package
# and and installed packages.
#
.PHONY: pkg-install-check-conflicts
pkg-install-check-conflicts:
	${RUN}${RM} -f ${WRKDIR}/.CONFLICTS;				\
${foreach _conflict_,${CONFLICTS},					\
	found="`${_PKG_BEST_EXISTS} '${_conflict_}' || ${TRUE}`";	\
	case "$$found" in						\
	"")	;;							\
	"${PKGNAME}")	;;						\
	*)	${ECHO} "$$found" >> ${WRKDIR}/.CONFLICTS ;;		\
	esac;								\
}									\
	${TEST} -f ${WRKDIR}/.CONFLICTS || exit 0;			\
	${ERROR_MSG} ${hline};						\
	${ERROR_MSG} "$${bf}${PKGNAME} conflicts with installed"	\
		"package(s):$${rm}";					\
	${ERROR_MSG};							\
	${CAT} ${WRKDIR}/.CONFLICTS | ${SED} -e "s|^|ERROR:    |";	\
	${ERROR_MSG};							\
	${ERROR_MSG} "They install the same files into the same place.";\
	${ERROR_MSG} "Please remove conflicts first with"		\
		"robotpkg_delete(1).";					\
	${ERROR_MSG} ${hline};						\
	${RM} -f ${WRKDIR}/.CONFLICTS;					\
	exit 1


# --- install-check-required (PRIVATE, mk/install/install.mk) --------------
#
# install-check-required checks if the package (perhaps an older
# version) is already installed on the system and required by other packages.
#
.PHONY: pkg-install-check-required
pkg-install-check-required:
	${RUN}								\
	found="`${_PKG_BEST_EXISTS} ${PKGWILDCARD} || ${TRUE}`";	\
	${TEST} -n "$$found" || exit 0;					\
	reqd="`${PKG_INFO} -qr "$$found" || ${TRUE}`";			\
	${TEST} -n "$$reqd" || exit 0;					\
	${ERROR_MSG} ${hline};						\
	${ERROR_MSG} "$${bf}$$found is required by other"		\
		"packages:$${rm}";					\
	for p in $$reqd; do						\
	  ${ERROR_MSG} "		$$p";				\
	done;								\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "You may use either of:";				\
	${ERROR_MSG} " - '$${bf}${MAKE} update$${rm}' in ${PKGPATH}";	\
	${ERROR_MSG} "   to rebuild the package and all dependent"	\
		"packages";						\
	${ERROR_MSG} " - '$${bf}${MAKE} replace$${rm}' in ${PKGPATH}";	\
	${ERROR_MSG} "   to replace only the package without re-linking"\
		"dependant packages,";					\
	${ERROR_MSG} "   risking various problems.";			\
	${ERROR_MSG} ${hline};						\
	exit 1


# --- pkg-install-check-files (PRIVATE, mk/install/install.mk) -------------
#
# pkg-install-check-files checks if files from the package PLIST would be
# overwritten by the install. Only PLIST_SRC is considered, anything generated
# by any custom GENERATE_PLIST script will be skipped.
#
$(call require, ${ROBOTPKG_DIR}/mk/plist/plist-vars.mk)

.PHONY: pkg-install-check-files
pkg-install-check-files:
	${RUN}${RM} -f ${WRKDIR}/conflicts.log;				\
	prefix="${PREFIX}";						\
	${CAT} /dev/null ${PLIST_SRC} |					\
	  ${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_AWK} |		\
	  ${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_SHLIB_AWK} |	\
	while read f; do						\
	  case $$f in							\
	    @cwd*)	set -- $$f; shift; prefix="$$@";;		\
	    @ignore*)	read f;;					\
	    @*) ;;							\
	    *)								\
		f="$$prefix/$$f";					\
		if ${TEST} -f "$$f"; then				\
		  pkg=`${PKG_INFO} -Q PKGPATH -F "$$f" 2>/dev/null||:`;	\
		  ${ECHO} "$${pkg:-unknown}" "$$f"			\
			 >>${WRKDIR}/conflicts.log;			\
		fi;;							\
	  esac;								\
	done;								\
	${TEST} -f ${WRKDIR}/conflicts.log || exit 0;			\
	${ERROR_MSG} "${hline}";					\
	${ERROR_MSG} "$${bf}Installation of ${PKGNAME} would$${rm}";	\
	${ERROR_MSG} "$${bf}overwrite already installed files.$${rm}";	\
	pkg=; n=;							\
	${SORT} <${WRKDIR}/conflicts.log | while read p f; do		\
	  if ${TEST} "$$pkg" != "$$p"; then				\
	    ${ECHO}; ${ECHO} "$${bf}Files from $$p package:$${rm}";	\
	  fi;								\
	  ${ECHO} "$$f";						\
	  pkg="$$p"; n=.$$n;						\
	  if ${TEST} "$${n##....................}" != "$$n"; then	\
	    ${ECHO} "[more conflicting files skipped]";			\
	    ${ECHO} "See ${WRKDIR}/conflicts.log";			\
	    break;							\
	  fi;								\
	done | ${ERROR_CAT};						\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "$${bf}Use \`${MAKE} ${MAKECMDGOALS} confirm\`"	\
		"in ${PKGPATH} to force installation.";			\
	${ERROR_MSG} "${hline}";					\
	exit 2


# --- pkg-register (PRIVATE, mk/install/install.mk) ------------------

# pkg-register populates the package database with the appropriate
# entries to register the package as being installed on the system.
#
define _REGISTER_DEPENDENCIES
	${SETENV} PKG_DBDIR=${_PKG_DBDIR}				\
		AWK=${AWK}						\
		PKG_ADMIN=${PKG_ADMIN_CMD}				\
	${SH} ${ROBOTPKG_DIR}/mk/pkg/register-dependencies
endef

.PHONY: pkg-register
ifndef NO_DEPENDS
  pkg-register: ${_COOKIE.depends}
endif
pkg-register: generate-metadata
	@${STEP_MSG} "Registering installation for ${PKGNAME}"
	${RUN}${RM} -fr ${_PKG_DBDIR}/${PKGNAME}
	${RUN}${MKDIR} ${_PKG_DBDIR}/${PKGNAME}
	${RUN}${CP} ${PKG_DB_TMPDIR}/* ${_PKG_DBDIR}/${PKGNAME}
	${RUN}${PKG_ADMIN} add ${PKGNAME}
	${RUN}								\
	case ${_AUTOMATIC}"" in						\
	[yY][eE][sS])	${PKG_ADMIN} set automatic=yes ${PKGNAME} ;;	\
	esac;								\
	{ :;								\
  $(foreach _pkg_,${DEPEND_PKG},					\
    $(if $(filter robotpkg,${PREFER.${_pkg_}}),				\
      $(if $(filter full,${DEPEND_METHOD.${_pkg_}}),			\
	  ${ECHO} '${DEPEND_ABI.${_pkg_}}';				\
  )))									\
	} | ${SORT} -u | ${_REGISTER_DEPENDENCIES} ${PKGNAME}
