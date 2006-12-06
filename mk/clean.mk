# $NetBSD: bsd.pkg.clean.mk,v 1.9 2006/10/09 11:44:06 joerg Exp $
#
# This Makefile fragment is included to bsd.pkg.mk and defines the
# relevant variables and targets for the "clean" phase.
#
# The following variables may be set by the package Makefile and
# specify how cleaning happens:
#
#    CLEANDEPENDS specifies the whether "cleaning" will also clean
#	in all dependencies, implied and direct.  CLEANDEPENDS
#	defaults to "no".
#
# The following targets are defined by bsd.pkg.clean.mk:
#
#    clean-depends is the target which descends into dependencies'
#	package directories and invokes the "clean" action.
#
#    do-clean is the target that does the actual cleaning, which
#	involves removing the work directory and other temporary
#	files used by the package.
#
#    clean is the target that is invoked by the user to perform
#	the "clean" action.
#
#    cleandir is an alias for "clean".
#

CLEANDEPENDS?=	no

.PHONY: clean-depends
clean-depends:
	${_PKG_SILENT}${_PKG_DEBUG}				\
	${_DEPENDS_WALK_CMD} ${PKGPATH} |			\
	while read dir; do					\
		cd ${CURDIR}/../../$$dir &&			\
		${RECURSIVE_MAKE} CLEANDEPENDS=no clean;	\
	done

.PHONY: pre-clean
pre-clean:

.PHONY: post-clean
post-clean:

.PHONY: do-clean
do-clean:
	@${PHASE_MSG} "Cleaning for ${PKGNAME}"
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if ${TEST} -d ${WRKDIR}; then					\
		if ${TEST} -w ${WRKDIR}; then				\
			${RM} -fr ${WRKDIR};				\
		else							\
			${STEP_MSG} ${WRKDIR}" not writable, skipping"; \
		fi;							\
        fi
ifdef WRKOBJDIR
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${RMDIR} ${BUILD_DIR} 2>/dev/null || ${TRUE};			\
	${RM} -f ${WRKDIR_BASENAME} 2>/dev/null || ${TRUE}
endif

_CLEAN_TARGETS+=	pre-clean
ifneq (,$(call isyes,CLEANDEPENDS))
_CLEAN_TARGETS+=	clean-depends
endif
_CLEAN_TARGETS+=	do-clean
_CLEAN_TARGETS+=	post-clean

.PHONY: clean
clean: ${_CLEAN_TARGETS}

.PHONY: cleandir
cleandir: clean
