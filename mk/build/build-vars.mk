# $NetBSD: bsd.build-vars.mk,v 1.3 2006/09/09 02:35:13 obache Exp $
#
# BUILD_DIRS is the list of directories in which to perform the build
#	process.  If the directories are relative paths, then they
#	are assumed to be relative to ${WRKSRC}.
#
# MAKE_PROGRAM is the path to the make executable that is run to
#	process the source makefiles.  This is always overridden by
#	the tools framework in pkgsrc/mk/tools/make.mk, but we provide
#	a default here for documentation purposes.
#
# MAKE_ENV is the shell environment that is exported to the make
#	process.
#
# MAKE_FLAGS is a list of arguments that is pass to the make process.
#
# MAKE_FILE is the path to the makefile that is processed by the make
#	executable.  If the path is relative, then it is assumed to
#	be relative to each directory listed in BUILD_DIRS.
#
BUILD_DIRS?=	${CONFIGURE_DIRS}
MAKE_PROGRAM?=	${MAKE}
MAKE_ENV?=	# empty
MAKE_FLAGS?=	# empty
MAKE_FILE?=	Makefile

MAKE_ENV+=	${ALL_ENV}
ifndef NO_EXPORT_CPP
MAKE_ENV+=	CPP=$(call quote,${CPP})
endif
MAKE_ENV+=	LOCALBASE=${LOCALBASE}
MAKE_ENV+=	NO_WHOLE_ARCHIVE_FLAG=${NO_WHOLE_ARCHIVE_FLAG}
MAKE_ENV+=	WHOLE_ARCHIVE_FLAG=${WHOLE_ARCHIVE_FLAG}
MAKE_ENV+=	PKGMANDIR=${PKGMANDIR}

# Add these bits to the environment used when invoking the recursive make
# processes for build-related phases.
#
PKGSRC_MAKE_ENV+=	PATH=${PATH}


# The following are the "public" targets provided by this module:
#
#    build
#
# The following targets may be overridden in a package Makefile:
#
#    pre-build, do-build, post-build
#

_COOKIE.build=  ${WRKDIR}/.build_done


# --- build (PUBLIC) -------------------------------------------------
#
# build is a public target to build the sources for the package.
#
.PHONY: build
ifndef NO_BUILD
  include ${PKGSRCDIR}/mk/build/build.mk
else
  ifeq (yes,$(call exists,${_COOKIE.build}))
build:
	@${DO_NADA}
  else
    ifdef _PKGSRC_BARRIER
build: configure build-cookie pkginstall
    else
build: barrier
    endif
  endif
endif


# --- build-cookie (PRIVATE) -----------------------------------------
#
# build-cookie creates the "build" cookie file.
#
.PHONY: build-cookie
build-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${_COOKIE.build} || ${FALSE}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir ${_COOKIE.build})
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${PKGNAME} > ${_COOKIE.build}
