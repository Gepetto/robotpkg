#
# Copyright (c) 2006 LAAS/CNRS                        --  Thu Dec  7 2006
# All rights reserved.
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
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# From  $NetBSD: bsd.pkg.update.mk,v 1.7 2006/10/05 12:56:27 rillig Exp $
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
#
#   3. All advertising materials mentioning   features or use of this
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

#
# This Makefile fragment contains the targets and variables for 
# "make update".
#
# There is no documentation on what "update" actually does.  This is merely
# an attempt to separate the magic into a separate module that can be
# reimplemented later.
#

NOCLEAN?=	NO	# don't clean up after update
REINSTALL?=	NO	# reinstall upon update

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

# The 'update' target can be used to update a package and all
# currently installed packages that depend upon this package.

_DDIR=	${WRKDIR}/.DDIR
_DLIST=	${WRKDIR}/.DLIST

.PHONY: update-create-ddir
update-create-ddir: ${_DDIR}

.PHONY: update
update: do-update

ifeq (yes,$(call exists,${_DDIR}))
RESUMEUPDATE?=	YES
CLEAR_DIRLIST?=	NO

do%update: .FORCE
	${_OVERRIDE_TARGET}
	@${PHASE_MSG} "Resuming update for ${PKGNAME}"
  ifneq (NO,$(strip ${REINSTALL}))
  ifneq (replace,${UPDATE_TARGET})
	${_PKG_SILENT}${_PKG_DEBUG}					\
		${RECURSIVE_MAKE} deinstall _UPDATE_RUNNING=YES DEINSTALLDEPENDS=ALL
  endif
  endif
else
RESUMEUPDATE?=	NO
CLEAR_DIRLIST?=	YES

do%update: .FORCE
	${_OVERRIDE_TARGET}
	${RUN}${RECURSIVE_MAKE} update-create-ddir
  ifneq (replace,${UPDATE_TARGET})
	${RUN}if ${PKG_INFO} -qe ${PKGBASE}; then			\
		${RECURSIVE_MAKE} deinstall _UPDATE_RUNNING=YES DEINSTALLDEPENDS=ALL \
		|| (${RM} ${_DDIR} && ${FALSE});			\
	fi
  endif
endif
	${RUN}${RECURSIVE_MAKE} ${UPDATE_TARGET} DEPENDS_TARGET=${DEPENDS_TARGET}
	${RUN}								\
	[ ! -s ${_DDIR} ] || for dep in `${CAT} ${_DDIR}` ; do		\
		(if cd ../.. && cd "$${dep}" ; then			\
			${PHASE_MSG} "Installing in $${dep}" &&		\
			if [ "(" "$(strip ${RESUMEUPDATE})" = "NO" -o	\
			     "$(strip ${REINSTALL})" != "NO" ")" -a	\
			     "${UPDATE_TARGET}" != "replace" ] ; then	\
				${RECURSIVE_MAKE} deinstall _UPDATE_RUNNING=YES; \
			fi &&						\
			${RECURSIVE_MAKE} ${UPDATE_TARGET}		\
				DEPENDS_TARGET=${DEPENDS_TARGET} ;	\
		else							\
			${PHASE_MSG} "Skipping removed directory $${dep}"; \
		fi) ;							\
	done
ifeq (NO,$(strip ${NOCLEAN}))
	${RUN} ${RECURSIVE_MAKE} clean-update CLEAR_DIRLIST=YES
endif


.PHONY: clean-update
clean-update:
	${_PKG_SILENT}${_PKG_DEBUG}${RECURSIVE_MAKE} update-create-ddir
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if [ -s ${_DDIR} ] ; then					\
		for dep in `${CAT} ${_DDIR}` ; do			\
			(if cd ../.. && cd "$${dep}" ; then		\
				${RECURSIVE_MAKE} clean;		\
			else						\
				${PHASE_MSG} "Skipping removed directory $${dep}";\
			fi) ;						\
		done ;							\
	fi
ifneq (NO,$(strip ${CLEAR_DIRLIST}))
	${RUN}${RECURSIVE_MAKE} clean
else
	${RUN}${RECURSIVE_MAKE} clean update-dirlist \
		DIRLIST="`${CAT} ${_DDIR}`" PKGLIST="`${CAT} ${_DLIST}`"
	@${WARNING_MSG} "preserved leftover directory list.  Your next"
	@${WARNING_MSG} "\`\`${MAKE} update'' may fail.  It is advised to use"
	@${WARNING_MSG} "\`\`${MAKE} update REINSTALL=YES'' instead!"
endif


.PHONY: update-dirlist
update-dirlist:
	${RUN}${MKDIR} -p ${WRKDIR}
ifdef PKGLIST
	${RUN}								\
	$(foreach __tmp__,${PKGLIST},${ECHO} >>${_DLIST} "${__tmp__}";)
endif
ifdef DIRLIST
	${RUN}								\
	$(foreach __tmp__,${DIRLIST},${ECHO} >>${_DDIR} "${__tmp__}";)
endif


${_DDIR}: ${_DLIST}
	${RUN}								\
	ddir=`${SED} 's:-[^-]*$$::' ${_DLIST}`;				\
	${ECHO} >${_DDIR};						\
	for pkg in $${ddir} ; do					\
		if ${PKG_INFO} -b "$${pkg}" >/dev/null 2>&1 ; then	\
			${PKG_INFO} -b "$${pkg}" | ${SED}	-ne	\
			    's,\([^/]*/[^/]*\)/Makefile:.*,\1,p' | 	\
			    ${HEAD} -1 >>${_DDIR};			\
		fi ;							\
	done

${_DLIST}: ${WRKDIR}
	${RUN}								\
	{ ${PKG_DELETE} -n "${PKGWILDCARD}" 2>&1 | 			\
		${GREP} '^	' |					\
		${AWK} '{ l[NR]=$$0 } END { for (i=NR;i>0;--i) print l[i] }' \
	|| ${TRUE}; } > $@
