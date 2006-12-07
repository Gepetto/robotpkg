# $NetBSD: bsd.pkg.barrier.mk,v 1.13 2006/11/03 08:01:04 joerg Exp $

_COOKIE.barrier=	${WRKDIR}/.barrier_cookie

# _BARRIER_PRE_TARGETS is a list of the targets that must be built before
#	the "barrier" target invokes a new make.
#
_BARRIER_PRE_TARGETS=	checksum makedirs depends

# _BARRIER_POST_TARGETS is a list of the targets that must be built after
#	the "barrier" target invokes a new make.  This list is specially
#	ordered so that if more than one is specified on the command-line,
#	then pkgsrc will still do the right thing.
#

_BARRIER_POST_TARGETS+=	extract
_BARRIER_POST_TARGETS+=	patch
_BARRIER_POST_TARGETS+=	configure
_BARRIER_POST_TARGETS+=	build
_BARRIER_POST_TARGETS+=	test
_BARRIER_POST_TARGETS+=	all
_BARRIER_POST_TARGETS+=	install
_BARRIER_POST_TARGETS+=	reinstall
_BARRIER_POST_TARGETS+=	replace
_BARRIER_POST_TARGETS+=	package
_BARRIER_POST_TARGETS+=	repackage

_BARRIER_CMDLINE_TARGETS+=$(filter ${_BARRIER_POST_TARGETS},${MAKECMDGOALS})


# --- barrier (PRIVATE) ----------------------------------------------
#
# barrier is a helper target that can be used to separate targets
# that should be built in a new make process from being built in
# the current one.  The targets that must be built after the "barrier"
# target invokes a new make should be listed in _BARRIER_POST_TARGETS,
# and should be of the form:
#
#	ifndef _PKGSRC_BARRIER
#	foo: barrier
#	else
#	foo: foo's real source dependencies
#	endif
#
# Note that none of foo's real source dependencies should include
# targets that occur before the barrier.
#

.PHONY: barrier-error-check
barrier-error-check: #error-check

.PHONY: barrier
barrier: ${_BARRIER_PRE_TARGETS} ${_COOKIE.barrier}
ifndef _PKGSRC_BARRIER
  ifdef PKG_VERBOSE
	@${PHASE_MSG} "Invoking \`\`"${_BARRIER_CMDLINE_TARGETS}"'' after barrier for ${PKGNAME}"
  endif
	${_PKG_SILENT}${_PKG_DEBUG}					\
	cd ${CURDIR}							\
	&& ${RECURSIVE_MAKE} _PKGSRC_BARRIER=yes ${_BARRIER_CMDLINE_TARGETS} \
	|| {								\
		exitcode="$$?";						\
		${RECURSIVE_MAKE} _PKGSRC_BARRIER=yes barrier-error-check; \
		exit "$$exitcode";					\
	}
  ifdef PKG_VERBOSE
	@${PHASE_MSG} "Leaving \`\`"${_BARRIER_CMDLINE_TARGETS}"'' after barrier for ${PKGNAME}"
  endif
endif


# --- barrier-cookie (PRIVATE) ---------------------------------------
#
# barrier-cookie creates the "barrier" cookie file.
#
${_COOKIE.barrier}:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${PKGNAME} > $@
