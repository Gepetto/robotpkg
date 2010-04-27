#
# Copyright (c) 2006-2010 LAAS/CNRS
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
	${RUN}${RM} -f ${WRKDIR}/.CONFLICTS
	${RUN}								\
${foreach _conflict_,${CONFLICTS},					\
	found="`${_PKG_BEST_EXISTS} ${_conflict_} || ${TRUE}`";		\
	case "$$found" in						\
	"")	;;							\
	*)	${ECHO} "$$found" >> ${WRKDIR}/.CONFLICTS ;;		\
	esac;								\
}
	${RUN}								\
	${TEST} -f ${WRKDIR}/.CONFLICTS || exit 0;			\
	${ECHO} ${hline};						\
	${ECHO} "$${bf}${PKGNAME} conflicts with installed"		\
		"package(s):$${rm}";					\
	${CAT} ${WRKDIR}/.CONFLICTS | ${SED} -e "s|^|    |";		\
	${ECHO};							\
	${ECHO} "They install the same files into the same place.";	\
	${ECHO} "Please remove conflicts first with"			\
		"robotpkg_delete(1).";					\
	${ECHO} ${hline};						\
	${RM} -f ${WRKDIR}/.CONFLICTS;					\
	exit 1


# --- install-check-installed (PRIVATE, mk/install/install.mk) -------
#
# install-check-installed checks if the package (perhaps an older
# version) is already installed on the system.
#
.PHONY: pkg-install-check-installed
pkg-install-check-installed:
	${RUN}									\
	found="`${_PKG_BEST_EXISTS} ${PKGWILDCARD} || ${TRUE}`";		\
	${TEST} -n "$$found" || exit 0;						\
	${ERROR_MSG} ${hline};							\
	${ERROR_MSG} "$${bf}$$found is already installed.$${rm}";		\
	${ERROR_MSG} "Perhaps an older version?";				\
	${ERROR_MSG} "";							\
	${ERROR_MSG} "If so, you may use either of:";				\
	if test -z "${PKG_PRESERVE}"; then					\
	${ERROR_MSG} "    - \`robotpkg_delete $$found' and";			\
	${ERROR_MSG} "      \`${MAKE} reinstall' to upgrade properly";		\
	fi;									\
	${ERROR_MSG} "    - \`${MAKE} update' to rebuild the package and all";	\
	${ERROR_MSG} "      of its dependencies";				\
	${ERROR_MSG} "    - \`${MAKE} replace' to replace only the package without";\
	${ERROR_MSG} "      re-linking dependencies, risking various problems.";\
	${ERROR_MSG} ${hline};							\
	exit 1


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
	esac
	${RUN}${_DEPENDS_PATTERNS_CMD} |		\
		${SORT} -u | ${_REGISTER_DEPENDENCIES} ${PKGNAME}
