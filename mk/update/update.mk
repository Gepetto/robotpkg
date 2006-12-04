# $NetBSD: bsd.pkg.update.mk,v 1.7 2006/10/05 12:56:27 rillig Exp $
#
# This Makefile fragment is included by bsd.pkg.mk and contains the targets
# and variables for "make update".
#
# There is no documentation on what "update" actually does.  This is merely
# an attempt to separate the magic into a separate module that can be
# reimplemented later.
#

NOCLEAN?=	NO	# don't clean up after update
REINSTALL?=	NO	# reinstall upon update

# UPDATE_TARGET is the target that is invoked when updating packages during
# a "make update".  This variable is user-settable within /etc/mk.conf.
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
  ifneq (NOreplace,${REINSTALL}${UPDATE_TARGET})
	${_PKG_SILENT}${_PKG_DEBUG}					\
		${RECURSIVE_MAKE} ${MAKEFLAGS} deinstall _UPDATE_RUNNING=YES DEINSTALLDEPENDS=ALL
  endif
else
RESUMEUPDATE?=	NO
CLEAR_DIRLIST?=	YES

do%update: .FORCE
	${_OVERRIDE_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}${RECURSIVE_MAKE} ${MAKEFLAGS} update-create-ddir
  ifneq (replace,${UPDATE_TARGET})
	${_PKG_SILENT}${_PKG_DEBUG}if ${PKG_INFO} -qe ${PKGBASE}; then	\
		${RECURSIVE_MAKE} ${MAKEFLAGS} deinstall _UPDATE_RUNNING=YES DEINSTALLDEPENDS=ALL \
		|| (${RM} ${_DDIR} && ${FALSE});			\
	fi
  endif
endif
	${_PKG_SILENT}${_PKG_DEBUG}					\
		${RECURSIVE_MAKE} ${MAKEFLAGS} ${UPDATE_TARGET} KEEP_WRKDIR=YES DEPENDS_TARGET=${DEPENDS_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}					\
	[ ! -s ${_DDIR} ] || for dep in `${CAT} ${_DDIR}` ; do		\
		(if cd ../.. && cd "$${dep}" ; then			\
			${PHASE_MSG} "Installing in $${dep}" &&		\
			if [ "(" "${RESUMEUPDATE}" = "NO" -o 		\
			     "${REINSTALL}" != "NO" ")" -a		\
			     "${UPDATE_TARGET}" != "replace" ] ; then	\
				${RECURSIVE_MAKE} ${MAKEFLAGS} deinstall _UPDATE_RUNNING=YES; \
			fi &&						\
			${RECURSIVE_MAKE} ${MAKEFLAGS} ${UPDATE_TARGET}	\
				DEPENDS_TARGET=${DEPENDS_TARGET:Q} ;	\
		else							\
			${PHASE_MSG} "Skipping removed directory $${dep}"; \
		fi) ;							\
	done
ifeq (NO,${NOCLEAN})
	${_PKG_SILENT}${_PKG_DEBUG}					\
		${RECURSIVE_MAKE} ${MAKEFLAGS} clean-update CLEAR_DIRLIST=YES
endif


.PHONY: clean-update
clean-update:
	${_PKG_SILENT}${_PKG_DEBUG}${RECURSIVE_MAKE} ${MAKEFLAGS} update-create-ddir
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if [ -s ${_DDIR} ] ; then					\
		for dep in `${CAT} ${_DDIR}` ; do			\
			(if cd ../.. && cd "$${dep}" ; then		\
				${RECURSIVE_MAKE} ${MAKEFLAGS} clean ;	\
			else						\
				${PHASE_MSG} "Skipping removed directory $${dep}";\
			fi) ;						\
		done ;							\
	fi
ifneq (NO,${CLEAR_DIRLIST})
	${_PKG_SILENT}${_PKG_DEBUG}${RECURSIVE_MAKE} ${MAKEFLAGS} clean
else
	${_PKG_SILENT}${_PKG_DEBUG}					\
		${RECURSIVE_MAKE} ${MAKEFLAGS} clean update-dirlist DIRLIST="`${CAT} ${_DDIR}`" PKGLIST="`${CAT} ${_DLIST}`"
	@${WARNING_MSG} "preserved leftover directory list.  Your next"
	@${WARNING_MSG} "\`\`${MAKE} update'' may fail.  It is advised to use"
	@${WARNING_MSG} "\`\`${MAKE} update REINSTALL=YES'' instead!"
endif


.PHONY: update-dirlist
update-dirlist:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} -p ${WRKDIR}
ifdef PKGLIST
	${_PKG_SILENT}${_PKG_DEBUG}					\
  $(foreach __tmp__,${PKGLIST},						\
	${ECHO} >>${_DLIST} "${__tmp__}";				\
  )
endif
ifdef DIRLIST
	${_PKG_SILENT}${_PKG_DEBUG}					\
  $(foreach __tmp__,${DIRLIST},						\
	${ECHO} >>${_DDIR} "${__tmp__}";				\
  )
endif


${_DDIR}: ${_DLIST}
	${_PKG_SILENT}${_PKG_DEBUG}					\
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
	${_PKG_SILENT}${_PKG_DEBUG}					\
	{ ${PKG_DELETE} -n "${PKGWILDCARD}" 2>&1 | 			\
		${GREP} '^	' |					\
		${AWK} '{ l[NR]=$$0 } END { for (i=NR;i>0;--i) print l[i] }' \
	|| ${TRUE}; } > ${_DLIST}
