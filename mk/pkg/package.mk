#
# Copyright (c) 2006,2009-2011,2013,2016 LAAS/CNRS
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
$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

# --- pkg-check-installed (PRIVATE, pkgsrc/mk/package/package.mk) ----
#
# pkg-check-installed verifies that the package is installed on
# the system.
#
.PHONY: pkg-check-installed
pkg-check-installed:
	${RUN}${PKG_INFO} -qe ${PKGNAME} && exit 0;			\
	found=`${_PKG_BEST_EXISTS} ${PKGWILDCARD} || ${TRUE}`;		\
	if ${TEST} -z "$$found"; then					\
	  ${RECURSIVE_MAKE} install;					\
	else								\
	  $(if $(filter tarup,${MAKECMDGOALS}),:,			\
	    ${ERROR_MSG} "${hline}";					\
	    ${ERROR_MSG} "$${bf}Mismatched versions for"		\
		"${PKGBASE}.$${rm}";					\
	    ${ERROR_MSG} "Installed version:	$$found";		\
	    ${ERROR_MSG} "Up-to-date version:	${PKGNAME}";		\
	    ${ERROR_MSG} "";						\
	    ${ERROR_MSG} "You may use either of:";			\
	    ${ERROR_MSG} " - '$${bf}${MAKE} update package$${rm}' in"	\
		"${PKGPATH}";						\
	    ${ERROR_MSG} "   to build an up-to-date binary package";	\
	    ${ERROR_MSG} " - '$${bf}${MAKE} tarup$${rm}' in"		\
		"${PKGPATH}";						\
	    ${ERROR_MSG} "   to build a binary package for $$found";	\
	    ${ERROR_MSG} "${hline}";					\
	    exit 2);							\
	fi


# --- pkg-tarup (PRIVATE) --------------------------------------------------
#
# pkg-tarup creates a binary package from an installed instance of
# PKGWILDCARD. The installed version might not match the one of the current
# Makefile.
#
.PHONY: pkg-tarup
pkg-tarup:
	${RUN}								\
	pkgfile=`${_PKG_BEST_EXISTS} ${PKGWILDCARD}`;			\
	${TEST} -n "$$pkgfile" ||					\
	    ${FAIL_MSG} "${PKGWILDCARD} not installed";			\
	pkgdb=${_PKG_DBDIR}/$$pkgfile;					\
	${TEST} -d "$$pkgdb" ||						\
		${FAIL_MSG} "no such directory: $$pkgdb";		\
	pkgbin=${PKGREPOSITORY}/$$pkgfile${PKG_SUFX};			\
									\
	chkfile() {							\
		if ${TEST} -f "$$pkgdb/$$2"; then			\
			${ECHO} " $$1 $$pkgdb/$$2";			\
		fi;							\
	};								\
	pkg_args="-v -l -u ${ROOT_USER} -g ${ROOT_GROUP}";		\
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
	prefix=`${PKG_INFO} -qp "$$pkgfile" |				\
		${SED} -e '1{s/^@cwd[ 	]*//;q;}'`;			\
	pkg_args=$$pkg_args" -p $$prefix -I $$prefix";			\
									\
	${MKDIR} ${PKGREPOSITORY} ||					\
		${FAIL_MSG} "cannot create directory: ${PKGREPOSITORY}";\
	${RM} -f $$pkgbin;						\
	${SED} -e '/^@comment MD5:/d' -e '/^@comment Symlink:/d'	\
	       -e '/^@cwd/d' -e '/^@src/d'				\
	       -e '/^@ignore/,/^.*$$/d'					\
              <"$$pkgdb/${_CONTENTS_FILE}" |				\
	${PKG_CREATE} $$pkg_args -f - $$pkgbin || {			\
	  s=$$?; ${RM} -f $$pkgbin; exit $$s;				\
	};								\
									\
	deps=`${PKG_INFO} -qn $$pkgfile`;				\
	for d in $$deps; do						\
	  dep=`${_PKG_BEST_EXISTS} $$d`;				\
	  if ${TEST} -z "$$dep"; then					\
	    ${RECURSIVE_MAKE} depends;					\
	    dep=`${_PKG_BEST_EXISTS} $$d`;				\
	  fi;								\
	  ${TEST} -n "$$dep" || ${FAIL_MSG} "$$d not installed";	\
	  depbin=${PKGREPOSITORY}/$$dep${PKG_SUFX};			\
	  if ${TEST} ! -f "$$depbin"; then				\
	    dir=`${PKG_INFO} -qQ PKGPATH $$dep`;			\
	    if cd ${ROBOTPKG_DIR}/$$dir; then				\
	      ${RECURSIVE_MAKE} tarup;					\
	    else							\
	      ${FAIL_MSG} "Can't cd to $$dir";				\
	    fi;								\
	  fi;								\
	done


# --- pkg-links (PRIVATE) --------------------------------------------
#
# pkg-links creates symlinks to the binary package from the modules to which
# the package belongs.
#
.PHONY: pkg-links
pkg-links:
	${RUN}pkgfile=`${_PKG_BEST_EXISTS} ${PKGWILDCARD}`;		\
	${FIND} ${PACKAGES} -type l -name $$pkgfile${PKG_SUFX} -print |	\
		${XARGS} ${RM} -f;					\
$(if ${NO_PUBLIC_BIN},,							\
	${STEP_MSG} "Linking package in ${PACKAGES}/${PKGPUBLICSUBDIR}";\
	${MKDIR} ${PACKAGES}/${PKGPUBLICSUBDIR} || {			\
	  ${ERROR_MSG} "Can't create directory "			\
	    "${PACKAGES}/${PKGPUBLICSUBDIR}.";				\
	  exit 1;							\
	};								\
	${RM} -f ${PACKAGES}/${PKGPUBLICSUBDIR}/$$pkgfile${PKG_SUFX};	\
	${LN} -s ../${PKGREPOSITORYSUBDIR}/$$pkgfile${PKG_SUFX}		\
	      ${PACKAGES}/${PKGPUBLICSUBDIR}/;				\
)									\
$(foreach _,${PACKAGES_SUBDIRS},					\
	for p in ${PACKAGES.$_}; do					\
	  if ${PKG_ADMIN} pmatch "$$p" '${PKGNAME}'; then		\
	    ${STEP_MSG} "Linking package in ${PACKAGES}/$_";		\
	    ${MKDIR} ${PACKAGES}/$_ || {				\
	      ${ERROR_MSG} "Can't create directory ${PACKAGES}/$_.";	\
	      exit 1;							\
	    };								\
	    ${RM} -f ${PACKAGES}/$_/$$pkgfile${PKG_SUFX};		\
	    ${LN} -s ../${PKGREPOSITORYSUBDIR}/$$pkgfile${PKG_SUFX}	\
	      ${PACKAGES}/$_/;						\
	  fi;								\
	done;								\
)


# --- pkg-update-summary (PRIVATE) -----------------------------------------
#
# pkg-update-summary updates the pkg_summary.gz file in ${PKGREPOSITORY} for
# the current package.
#
DEPEND_METHOD.gzip+=	bootstrap
include ${ROBOTPKG_DIR}/mk/sysdep/gzip.mk

.PHONY: pkg-update-summary
pkg-update-summary:
	${RUN}								\
	pkgfile=`${_PKG_BEST_EXISTS} ${PKGWILDCARD}`;			\
	${TEST} -n "$$pkgfile" ||					\
	  ${FAIL_MSG} "${PKGWILDCARD} not found";			\
	dirs="${PKGREPOSITORY}";					\
	dirs="$$dirs ${PACKAGES}/${PKGPUBLICSUBDIR}";			\
$(foreach _,${PACKAGES_SUBDIRS},					\
	dirs="$$dirs ${PACKAGES}/$_";					\
)									\
	for d in $$dirs; do						\
	  ${TEST} -d "$$d" || continue;					\
	  ${TEST} -s "$$d/${PKGSUMMARY}" ||				\
	    ${GZIP_CMD} -c9 </dev/null >$$d/${PKGSUMMARY};		\
	  ${MV} -f $$d/${PKGSUMMARY} $$d/${PKGSUMMARY}~;		\
	  ${GZIP_CMD} -dc $$d/${PKGSUMMARY}~ | {			\
	    ${AWK} -F= -vskip="$$pkgfile" '				\
	      NF {							\
	        if ($$1 == "PKGNAME") { pkgname = $$2 };		\
	        if (e) { e = e "\n" $$0; } else { e = $$0; }		\
	      }								\
	      !NF {							\
	        if (pkgname != skip) { print e; print; }		\
	        e = "";							\
	      }';							\
	    if ${TEST} -f "$$d/$$pkgfile${PKG_SUFX}"; then		\
	      ${PKG_INFO} -X "$$d/$$pkgfile${PKG_SUFX}";		\
	    fi;								\
	  } | ${GZIP_CMD} -c9 > $$d/${PKGSUMMARY};			\
	done
