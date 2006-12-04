# $NetBSD: build.mk,v 1.9 2006/11/09 02:53:15 rillig Exp $
#
# This file defines what happens in the build phase, excluding the
# self-test, which is defined in test.mk.
#
# Package-settable variables:
#
# BUILD_MAKE_FLAGS is the list of arguments that is passed to the make
#	process, in addition to the usual MAKE_FLAGS.
#
# BUILD_TARGET is the target from ${MAKE_FILE} that should be invoked
#	to build the sources.
#
# Variables defined in this file:
#
# BUILD_MAKE_CMD
#	This command sets the proper environment for the build phase
#	and runs make(1) on it. It takes a list of make targets and
#	flags as argument.
#

BUILD_MAKE_FLAGS?=	# none
BUILD_TARGET?=		all

BUILD_MAKE_CMD= \
	${SETENV} ${MAKE_ENV}						\
		${MAKE_PROGRAM} ${_MAKE_JOBS}				\
			${MAKE_FLAGS} ${BUILD_MAKE_FLAGS}		\
			-f ${MAKE_FILE}


# --- build (PUBLIC) -------------------------------------------------
#
# build is a public target to build the sources from the package.
#
_BUILD_TARGETS+=	configure
_BUILD_TARGETS+=	acquire-build-lock
_BUILD_TARGETS+=	${_COOKIE.build}
_BUILD_TARGETS+=	release-build-lock
#_BUILD_TARGETS+=	pkginstall

.PHONY: build
ifeq (yes,$(call exists,${_COOKIE.build}))
build:
	@${DO_NADA}
else
build: ${_BUILD_TARGETS}
endif

.PHONY: acquire-build-lock release-build-lock
acquire-build-lock: acquire-lock
release-build-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.build}))
${_COOKIE.build}:
	@${DO_NADA}
else
${_COOKIE.build}: real-build
endif

# --- real-build (PRIVATE) -------------------------------------------
#
# real-build is a helper target onto which one can hook all of the
# targets that do the actual building of the sources.
#
_REAL_BUILD_TARGETS+=	build-message
#_REAL_BUILD_TARGETS+=	build-vars
#_REAL_BUILD_TARGETS+=	pre-build-checks-hook
_REAL_BUILD_TARGETS+=	pre-build
_REAL_BUILD_TARGETS+=	do-build
_REAL_BUILD_TARGETS+=	post-build
_REAL_BUILD_TARGETS+=	build-cookie
#_REAL_BUILD_TARGETS+=	error-check

.PHONY: real-build
real-build: ${_REAL_BUILD_TARGETS}

.PHONY: build-message
build-message:
	@${PHASE_MSG} "Building for ${PKGNAME}"


# --- pre-build, do-build, post-build (PUBLIC, override) -------------
#
# {pre,do,post}-build are the heart of the package-customizable
# build targets, and may be overridden within a package Makefile.
#

do%build: .FORCE
	${_OVERRIDE_TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _dir_,${BUILD_DIRS},						\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${BUILD_MAKE_CMD} ${BUILD_TARGET};				\
)

.PHONY: pre-build post-build
pre-build:

post-build:
