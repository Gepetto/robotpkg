#
# Copyright (c) 2006,2009-2011 LAAS/CNRS
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
# From $NetBSD: package.mk,v 1.6 2006/11/03 08:01:04 joerg Exp $
#
#                                      Anthony Mallet on Thu Nov 30 2006
#

PKG_SUFX?=		.tgz
PKGFILE?=		${PKGREPOSITORY}/${PKGNAME}${PKG_SUFX}
PKGREPOSITORY?=		${PACKAGES}/${PKGREPOSITORYSUBDIR}
PKGREPOSITORYSUBDIR?=	All

# --- pkg-check-installed (PRIVATE, pkgsrc/mk/package/package.mk) ----
#
# pkg-check-installed verifies that the package is installed on
# the system.
#
.PHONY: pkg-check-installed
pkg-check-installed:
	${RUN}${PKG_INFO} -qe ${PKGNAME} ||				\
	  ${FAIL_MSG} "${PKGNAME} is not installed.";			\


# --- pkg-create (PRIVATE, pkgsrc/mk/package/package.mk) -------------
#
# pkg-create creates the binary package.
#
.PHONY: pkg-create
pkg-create: pkg-remove ${PKGFILE} pkg-links

_PKG_ARGS_PACKAGE+=	${_PKG_CREATE_ARGS}
_PKG_ARGS_PACKAGE+=	-p ${PREFIX}

${PKGFILE}: ${_CONTENTS_TARGETS}
	${RUN}${MKDIR} $(dir $@);					\
	depends=;							\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter robotpkg,${PREFER.${_pkg_}}),				\
      $(if $(filter full,${DEPEND_METHOD.${_pkg_}}),			\
	depends=$$depends' ${DEPEND_ABI.${_pkg_}}';			\
  )))									\
	${PKG_CREATE} ${_PKG_ARGS_PACKAGE}				\
		$${depends:+-P "$${depends}"} $@ || {			\
	  exitcode=$$?;							\
	  ${ERROR_MSG} "$(notdir ${PKG_CREATE}) failed ($$exitcode)";	\
	  ${RM} -f $@;							\
	  exit 1;							\
	}


# --- pkg-remove (PRIVATE) -------------------------------------------
#
# pkg-remove removes the binary package from the package
# repository.
#
.PHONY: pkg-remove
pkg-remove:
	${RUN}${RM} -f ${PKGFILE}


# --- pkg-links (PRIVATE) --------------------------------------------
#
# pkg-links creates symlinks to the binary package from the
# non-primary categories to which the package belongs.
#
pkg-links: pkg-delete-links
	${RUN}								\
$(foreach _dir_,$(addprefix ${PACKAGES}/,${CATEGORIES}),		\
	${MKDIR} ${_dir_};						\
	if ${TEST} ! -d ${_dir_}; then					\
		${ERROR_MSG} "Can't create directory "${_dir_}".";	\
		exit 1;							\
	fi;								\
	${RM} -f ${_dir_}/$(notdir ${PKGFILE}); 			\
	${LN} -s ../${PKGREPOSITORYSUBDIR}/$(notdir ${PKGFILE}) ${_dir_}; \
)


# --- pkg-delete-links (PRIVATE) -------------------------------------
#
# pkg-delete-links removes the symlinks to the binary package from
# the non-primary categories to which the package belongs.
#
pkg-delete-links:
	${RUN}								\
	${FIND} ${PACKAGES} -type l -name $(notdir ${PKGFILE}) -print |	\
	${XARGS} ${RM} -f


# --- pkg-tarup (PRIVATE) --------------------------------------------------
#
# pkg-tarup creates a binary package from an installed instance of
# PKGWILDCARD. The installed version might not match the one of the current
# Makefile, so take care to override PKGFILE before invoking other pkg-*
# targets.
#
_PKG_TARUP_TARGETS+=	pkg-tarup-message
_PKG_TARUP_TARGETS+=	pkg-remove
_PKG_TARUP_TARGETS+=	pkg-do-tarup
_PKG_TARUP_TARGETS+=	pkg-links

.PHONY: pkg-tarup
pkg-tarup: _PKG_TARUP_NAME=$(shell ${_PKG_BEST_EXISTS} ${PKGWILDCARD})
pkg-tarup: override PKGFILE=${PKGREPOSITORY}/${_PKG_TARUP_NAME}${PKG_SUFX}
pkg-tarup: ${_PKG_TARUP_TARGETS}

.PHONY: pkg-tarup-message
pkg-tarup-message:
	${RUN}${TEST} -z "${_PKG_TARUP_NAME}" &&			\
	  ${FAIL_MSG} "No package matching ${PKGWILDCARD} installed.";	\
	${PHASE_MSG} "Building binary package from installed"		\
	  "${_PKG_TARUP_NAME}"

.PHONY: pkg-do-tarup
pkg-do-tarup:
	${RUN}								\
	pkgdb=${_PKG_DBDIR}/${_PKG_TARUP_NAME};				\
	${TEST} -d "$$pkgdb" ||						\
		${FAIL_MSG} "no such directory: $$pkgdb";		\
	chkfile() {							\
		if ${TEST} -f "$$pkgdb/$$2"; then			\
			${ECHO} " $$1 $$pkgdb/$$2";			\
		fi;							\
	};								\
									\
	pkg_args="-v -l";						\
	pkg_args=$$pkg_args`chkfile -B ${_BUILD_INFO_FILE}`;		\
	pkg_args=$$pkg_args`chkfile -b ${_BUILD_VERSION_FILE}`;		\
	pkg_args=$$pkg_args`chkfile -c ${_COMMENT_FILE}`;		\
	pkg_args=$$pkg_args`chkfile -d ${_DESCR_FILE}`;			\
	pkg_args=$$pkg_args`chkfile -i +INSTALL`;			\
	pkg_args=$$pkg_args`chkfile -k +DEINSTALL`;			\
	pkg_args=$$pkg_args`chkfile -D ${_MESSAGE_FILE}`;		\
	pkg_args=$$pkg_args`chkfile -n ${_PRESERVE_FILE}`;		\
	pkg_args=$$pkg_args`chkfile -S ${_SIZE_ALL_FILE}`;		\
	pkg_args=$$pkg_args`chkfile -s ${_SIZE_PKG_FILE}`;		\
									\
	prefix=`${PKG_INFO} -qp "${_PKG_TARUP_NAME}" | 			\
		${SED} -e '1{s/^@cwd[ 	]*//;q;}'`;			\
	pkg_args=$$pkg_args" -p $$prefix -L $$prefix -I $$prefix";	\
									\
	${SED}	-e '/^@name/d' 						\
		-e '/^@comment MD5:/d' -e '/^@comment Symlink:/d'	\
		-e '/^@mtree/d' 					\
		-e '/^@blddep/d' -e '/^@pkgdep/d'			\
		-e '/^@cwd/d' -e '/^@src/d' 				\
		-e '/^@ignore/,/^.*$$/d' 				\
                <"$$pkgdb/${_CONTENTS_FILE}" |				\
	${PKG_CREATE} $$pkg_args -f - ${PKGFILE}
