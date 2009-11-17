# $LAAS: update.mk 2009/11/17 17:40:48 mallet $
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
#   3. All  advertising  materials  mentioning   features  or use of this
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
# From $NetBSD: bsd.pkg.update.mk,v 1.7 2006/10/05 12:56:27 rillig Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006
#

# This Makefile fragment contains the targets and variables for 
# "make update".
#
# The 'update' target can be used to update a package and all
# currently installed packages that depend upon this package.
#

$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

# UPDATE_TARGET is the target that is invoked when updating packages during
# a "make update".  This variable is user-settable within etc/robotpkg.conf.
#
ifndef UPDATE_TARGET
  ifeq (update,${DEPENDS_TARGET})
    ifneq (,$(filter package,${MAKECMDGOALS}))
UPDATE_TARGET=	package
    else
UPDATE_TARGET=	install
    endif
  else
UPDATE_TARGET=	${DEPENDS_TARGET}
  endif
endif

_DDIR=	${WRKDIR}/.DDIR
_DLIST=	${WRKDIR}/.DLIST

.PHONY: update-create-ddir
update-create-ddir: ${_DDIR}

.PHONY: update
update: do-update
ifneq (,$(call isyes,${UPDATE_CLEAN}))
  update: CLEAR_DIRLIST=YES
  update: clean-update
endif
update: update-done-message

ifeq (yes,$(call exists,${_DDIR}))
  RESUMEUPDATE?=	YES
  CLEAR_DIRLIST?=	NO

  do%update: .FORCE
	${_OVERRIDE_TARGET}
	@${PHASE_MSG} "Resuming update for ${PKGNAME}"
    ifneq (replace,${UPDATE_TARGET})
	${RUN}${RECURSIVE_MAKE} deinstall				\
		_UPDATE_RUNNING=YES DEINSTALLDEPENDS=yes
    endif
else
  RESUMEUPDATE?=	NO
  CLEAR_DIRLIST?=	YES

  do%update: update-create-ddir .FORCE
	${_OVERRIDE_TARGET}
    ifneq (replace,${UPDATE_TARGET})
	${RUN}if ${PKG_INFO} -qe ${PKGBASE}; then			\
		${RECURSIVE_MAKE} deinstall _UPDATE_RUNNING=YES DEINSTALLDEPENDS=yes \
		|| (${RM} ${_DDIR} && ${FALSE});			\
	fi
    endif
endif
	${RUN}${RECURSIVE_MAKE} ${UPDATE_TARGET} DEPENDS_TARGET=${DEPENDS_TARGET}
	${RUN}								\
	[ ! -s ${_DDIR} ] || for dep in `${CAT} ${_DDIR}` ; do		\
		(if cd ../.. && cd "$${dep}" ; then			\
			${PHASE_MSG} "Installing in $${dep}" &&		\
			if [ "$(strip ${RESUMEUPDATE})" = "NO" -a	\
			     "${UPDATE_TARGET}" != "replace" ] ; then	\
				${RECURSIVE_MAKE} deinstall _UPDATE_RUNNING=YES; \
			fi &&						\
			${RECURSIVE_MAKE} ${UPDATE_TARGET}		\
				DEPENDS_TARGET=${DEPENDS_TARGET} ;	\
		else							\
			${PHASE_MSG} "Skipping removed directory $${dep}"; \
		fi) ;							\
	done

.PHONY: update-done-message
update-done-message:
	@${PHASE_MSG} "Done \`update' for ${PKGNAME}"

.PHONY: clean-update
clean-update: update-create-ddir
	${RUN}[ ! -s ${_DDIR} ] || for dep in `${CAT} ${_DDIR}` ; do	\
	  (cd ../.. && cd $${dep} && ${RECURSIVE_MAKE} clean) || {	\
	    noclean=$$noclean" "$$dep;					\
	    (cd ../.. && cd $${dep} && 					\
	      ${RECURSIVE_MAKE} install-clean ||:)			\
	  };								\
	done;								\
	$(if $(filter NO, ${CLEAR_DIRLIST}),				\
	  ${MV} ${_DDIR} ${TMPDIR}/$(notdir ${_DDIR});			\
	  ${MV} ${_DLIST} ${TMPDIR}/$(notdir ${_DLIST});		\
	)								\
	${RECURSIVE_MAKE} clean || {					\
	  noclean=$$noclean" "${PKGPATH};				\
	  ${RECURSIVE_MAKE} install-clean ||:;				\
	};								\
	$(if $(filter NO,${CLEAR_DIRLIST}),				\
		${MKDIR} -p ${WRKDIR};					\
		${MV} ${TMPDIR}/$(notdir ${_DDIR}) ${_DDIR};		\
		${MV} ${TMPDIR}/$(notdir ${_DLIST}) ${_DLIST};		\
		${WARNING_MSG}						\
			"preserved leftover directory list.  Your next";\
		${WARNING_MSG} "\`\`${MAKE} update'' may fail."		\
			"It is advised to use";				\
		${WARNING_MSG}						\
			"\`\`${MAKE} update REINSTALL=YES'' instead!";	\
	)								\
	if ${TEST} -n "$$noclean"; then					\
	    ${WARNING_MSG} ${hline};					\
	    ${WARNING_MSG} "Temporary files leftover for:";		\
	    for pkg in $$noclean; do					\
	      ${WARNING_MSG} "		$$pkg";				\
	    done;							\
	    ${WARNING_MSG} ${hline};					\
	fi;								\


${_DDIR}: ${_DLIST}
	${RUN} pkgs=`${CAT} ${_DLIST}`;					\
	if [ "$$pkgs" ]; then ${PKG_INFO} -Q PKGPATH $$pkgs; fi > ${_DDIR}

# Note that "pkg_info -qR" wouldn't work here, since it lists only the
# packages that require this package directly.
${_DLIST}: ${WRKDIR}
	${RUN}								\
	${PKG_DELETE} -nr "${PKGWILDCARD}" 2>&1				\
	| ${SED} -n '/^deinstalling /{s///;G;h;};$${g;p;}' > ${_DLIST}
