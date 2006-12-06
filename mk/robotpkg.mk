#	$NetBSD: bsd.pkg.mk,v 1.1892 2006/10/23 14:40:14 rillig Exp $
#
# This file is in the public domain.
#
# Please see the pkgsrc/doc/guide manual for details on the
# variables used in this make file template.
#
# Default sequence for "all" is:
#
#    bootstrap-depends
#    fetch
#    checksum
#    depends
#    tools
#    extract
#    patch
#    wrapper
#    configure
#    build
#
.DEFAULT_GOAL:=build

.PHONY: all
all: build


# --------------------------------------------------------------------
#
# Include any preferences, if not already included, and common definitions
#
include ../../mk/robotpkg.prefs.mk
include ../../mk/internal/error.mk


############################################################################
# Transform package Makefile variables and set defaults
############################################################################

##### PKGBASE, PKGNAME[_NOREV], PKGVERSION

PKGBASE?=		$(shell echo ${PKGNAME} | sed -e 's/-[^-]*$$//')
PKGVERSION?=		$(shell echo ${PKGNAME} | sed -e 's/^.*-//')
ifneq (,${PKGREVISION})
ifneq (0,${PKGREVISION})
ifdef PKGNAME
PKGNAME_NOREV:=		${PKGNAME}
PKGNAME:=		${PKGNAME}r${PKGREVISION}
else
PKGNAME?=		${DISTNAME}r${PKGREVISION}
PKGNAME_NOREV=		${DISTNAME}
endif
else
PKGNAME?=		${DISTNAME}
PKGNAME_NOREV=		${PKGNAME}
endif
else
PKGNAME?=		${DISTNAME}
PKGNAME_NOREV=		${PKGNAME}
endif

##### Others

BUILD_DEPENDS?=		# empty
COMMENT?=		(no description)
DEPENDS?=		# empty
DESCR_SRC?=		${PKGDIR}/DESCR
INTERACTIVE_STAGE?=	none
MAINTAINER?=		openrobots@laas.fr
PKGWILDCARD?=		${PKGBASE}-[0-9]*
WRKSRC?=		${WRKDIR}/${DISTNAME}

ifneq (,$(or $(call isyes,$(INSTALL_UNSTRIPPED)), $(DEBUG_FLAGS)))
_INSTALL_UNSTRIPPED=	# set (flag used by platform/*.mk)
endif

include ${PKGSRCDIR}/mk/robotpkg.use.mk


# --- Sanity checks --------------------------------------------------

# Fail-safe in the case of circular dependencies
ifdef _PKGSRC_DEPS
ifdef PKGNAME
ifneq (,$(filter $(PKGNAME), $(_PKGSRC_DEPS)))
PKG_FAIL_REASON+=	"Circular dependency detected"
endif
endif
endif

ifeq (,$(CATEGORIES))
PKG_FAIL_REASON+='CATEGORIES are mandatory.'
endif
ifeq (,$(DISTNAME))
PKG_FAIL_REASON+='DISTNAME are mandatory.'
endif


CPPFLAGS+=	${CPP_PRECOMP_FLAGS}

ALL_ENV+=	CC=$(call quote,${CC})
ALL_ENV+=	CFLAGS=$(call quote,${CFLAGS})
ALL_ENV+=	CPPFLAGS=$(call quote,${CPPFLAGS})
ALL_ENV+=	CXX=$(call quote,${CXX})
ALL_ENV+=	CXXFLAGS=$(call quote,${CXXFLAGS})
ALL_ENV+=	COMPILER_RPATH_FLAG=$(call quote,${COMPILER_RPATH_FLAG})
ALL_ENV+=	F77=$(call quote,${FC})
ALL_ENV+=	FC=$(call quote,${FC})
ALL_ENV+=	FFLAGS=$(call quote,${FFLAGS})
ALL_ENV+=	LANG=C
ALL_ENV+=	LC_COLLATE=C
ALL_ENV+=	LC_CTYPE=C
ALL_ENV+=	LC_MESSAGES=C
ALL_ENV+=	LC_MONETARY=C
ALL_ENV+=	LC_NUMERIC=C
ALL_ENV+=	LC_TIME=C
ALL_ENV+=	LDFLAGS=$(call quote,${LDFLAGS})
ALL_ENV+=	LINKER_RPATH_FLAG=$(call quote,${LINKER_RPATH_FLAG})
ALL_ENV+=	PATH=${PATH}:${LOCALBASE}/bin
ALL_ENV+=	PREFIX=${PREFIX}

_BUILD_DEFS=		${BUILD_DEFS}
_BUILD_DEFS+=		LOCALBASE
_BUILD_DEFS+=		PKGINFODIR
_BUILD_DEFS+=		PKGMANDIR

# Store the result in the +BUILD_INFO file so we can query for the build
# options using "pkg_info -Q PKG_OPTIONS <pkg>".
#
ifneq (,$(and $(PKG_SUPPORTED_OPTIONS), $(PKG_OPTIONS)))
_BUILD_DEFS+=            PKG_OPTIONS
endif

ifndef DEPOT_SUBDIR
PKG_FAIL_REASON+=	"DEPOT_SUBDIR may not be empty."
endif

# ZERO_FILESIZE_P exits with a successful return code if the given file
#	has zero length.
# NONZERO_FILESIZE_P exits with a successful return code if the given file
#	has nonzero length.
#
_ZERO_FILESIZE_P=	${AWK} 'END { exit (NR > 0) ? 1 : 0; }'
_NONZERO_FILESIZE_P=	${AWK} 'END { exit (NR > 0) ? 0 : 1; }'

_INTERACTIVE_COOKIE=	${.CURDIR}/.interactive_stage
_NULL_COOKIE=		${WRKDIR}/.null

# Miscellaneous overridable commands:
SHCOMMENT?=		${ECHO_MSG} >/dev/null '***'


# Debugging levels for this file, dependent on PKG_DEBUG_LEVEL definition
# 0 == normal, default, quiet operation
# 1 == all shell commands echoed before invocation
# 2 == shell "set -x" operation
PKG_DEBUG_LEVEL?=	0
_PKG_SILENT=		@
_PKG_DEBUG=		# empty
_PKG_DEBUG_SCRIPT=	# empty

ifeq (1,${PKG_DEBUG_LEVEL})
_PKG_SILENT=		# empty
endif

ifeq (2,${PKG_DEBUG_LEVEL})
_PKG_SILENT=		# empty
_PKG_DEBUG=		set -x;
_PKG_DEBUG_SCRIPT=	${SH} -x
endif


# A few aliases for *-install targets
INSTALL=		${TOOLS_INSTALL}
INSTALL_PROGRAM?= 	\
	${INSTALL} ${COPY} ${_STRIPFLAG_INSTALL} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE}
INSTALL_SCRIPT?= 	\
	${INSTALL} ${COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE}
INSTALL_LIB?= 		\
	${INSTALL} ${COPY} -o ${BINOWN} -g ${BINGRP} -m ${BINMODE}
INSTALL_DATA?= 		\
	${INSTALL} ${COPY} -o ${SHAREOWN} -g ${SHAREGRP} -m ${SHAREMODE}
INSTALL_MAN?= 		\
	${INSTALL} ${COPY} -o ${MANOWN} -g ${MANGRP} -m ${MANMODE}
INSTALL_PROGRAM_DIR?= 	\
	${INSTALL} -d -o ${BINOWN} -g ${BINGRP} -m ${PKGDIRMODE}
INSTALL_SCRIPT_DIR?= 	\
	${INSTALL_PROGRAM_DIR}
INSTALL_LIB_DIR?= 	\
	${INSTALL_PROGRAM_DIR}
INSTALL_DATA_DIR?= 	\
	${INSTALL} -d -o ${SHAREOWN} -g ${SHAREGRP} -m ${PKGDIRMODE}
INSTALL_MAN_DIR?= 	\
	${INSTALL} -d -o ${MANOWN} -g ${MANGRP} -m ${PKGDIRMODE}

INSTALL_MACROS=	BSD_INSTALL_PROGRAM=$(call quote,${INSTALL_PROGRAM})		\
		BSD_INSTALL_SCRIPT=$(call quote,${INSTALL_SCRIPT})		\
		BSD_INSTALL_LIB=$(call quote,${INSTALL_LIB})			\
		BSD_INSTALL_DATA=$(call quote,${INSTALL_DATA})			\
		BSD_INSTALL_MAN=$(call quote,${INSTALL_MAN})			\
		BSD_INSTALL=$(call quote,${INSTALL})				\
		BSD_INSTALL_PROGRAM_DIR=$(call quote,${INSTALL_PROGRAM_DIR})	\
		BSD_INSTALL_SCRIPT_DIR=$(call quote,${INSTALL_SCRIPT_DIR})	\
		BSD_INSTALL_LIB_DIR=$(call quote,${INSTALL_LIB_DIR})		\
		BSD_INSTALL_DATA_DIR=$(call quote,${INSTALL_DATA_DIR})		\
		BSD_INSTALL_MAN_DIR=$(call quote,${INSTALL_MAN_DIR})		\
		BSD_INSTALL_GAME=$(call quote,${INSTALL_GAME})			\
		BSD_INSTALL_GAME_DATA=$(call quote,${INSTALL_GAME_DATA})	\
		BSD_INSTALL_GAME_DIR=$(call quote,${INSTALL_GAME_DIR})
MAKE_ENV+=	${INSTALL_MACROS}
SCRIPTS_ENV+=	${INSTALL_MACROS}

# OVERRIDE_DIRDEPTH represents the common directory depth under
#       ${WRKSRC} up to which we find the files that need to be
#       overridden.  By default, we search two levels down, i.e.,
#       */*/file.
#
OVERRIDE_DIRDEPTH?=     2


# Used to print all the '===>' style prompts - override this to turn them off.
ECHO_MSG?=		${ECHO}
PHASE_MSG?=		${ECHO_MSG} "===>"
STEP_MSG?=		${ECHO_MSG} "=>"
WARNING_MSG?=		${ECHO_MSG} 1>&2 "WARNING:"
ERROR_MSG?=		${ECHO_MSG} 1>&2 "ERROR:"

WARNING_CAT?=		${SED} -e "s|^|WARNING: |" 1>&2
ERROR_CAT?=		${SED} -e "s|^|ERROR: |" 1>&2

# How to do nothing.  Override if you, for some strange reason, would rather
# do something.
DO_NADA?=		${TRUE}

#
# Config file related settings - see doc/pkgsrc.txt
#
PKG_SYSCONFVAR?=	${PKGBASE}
PKG_SYSCONFSUBDIR?=	# empty
PKG_SYSCONFDEPOTBASE=	# empty
PKG_SYSCONFBASEDIR=	${PKG_SYSCONFBASE}
ifdef PKG_SYSCONFSUBDIR
DFLT_PKG_SYSCONFDIR:=	${PKG_SYSCONFBASEDIR}/${PKG_SYSCONFSUBDIR}
else
DFLT_PKG_SYSCONFDIR:=	${PKG_SYSCONFBASEDIR}
endif
PKG_SYSCONFDIR=		${DFLT_PKG_SYSCONFDIR}

ALL_ENV+=		PKG_SYSCONFDIR=${PKG_SYSCONFDIR}
_BUILD_DEFS+=		PKG_SYSCONFBASEDIR PKG_SYSCONFDIR

# Get the proper dependencies and set the PATH to use the compiler
# named in PKGSRC_COMPILER.
#
include ../../mk/compiler/compiler-vars.mk

# Locking
include ${PKGSRCDIR}/mk/internal/locking.mk

# Tools
include ${PKGSRCDIR}/mk/tools/tools-vars.mk

# Barriers
include ${PKGSRCDIR}/mk/internal/barrier.mk

#
# Now print some error messages that we know we should ignore the pkg
#
ifdef PKG_FAIL_REASON

fetch checksum extract patch configure all build install package \
update depends: do-check-pkg-fail-or-skip-reason

.PHONY: do-check-pkg-fail-or-skip-reason
do-check-pkg-fail-or-skip-reason:
     ifdef SKIP_SILENT
	@${DO_NADA}
     else
       ifdef PKG_FAIL_REASON
	@for str in ${PKG_FAIL_REASON}; do				\
		${ERROR_MSG} "$$str";					\
	done
       endif
     endif
     ifdef PKG_FAIL_REASON
	@${FALSE}
     endif
endif

.PHONY: do-check-pkg-fail-reason
do-check-pkg-fail-reason:
	@${DO_NADA}

# This target should appear as a dependency of every top level target that
# is intended to be called by the user or by a package different from the
# current package.
ifdef PKG_FAIL_REASON
do-check-pkg-fail-reason: do-check-pkg-fail-or-skip-reason
endif


# Add these defs to the ones dumped into +BUILD_DEFS
_BUILD_DEFS+=	PKGPATH
_BUILD_DEFS+=	OPSYS OS_VERSION MACHINE_ARCH MACHINE_GNU_ARCH
_BUILD_DEFS+=	CPPFLAGS CFLAGS FFLAGS LDFLAGS
_BUILD_DEFS+=	LICENSE RESTRICTED


################################################################
# More standard targets start here.
#
# These are the body of the build/install framework.  If you are
# not happy with the default actions, and you can't solve it by
# adding pre-* or post-* targets/scripts, override these.
################################################################

.PHONY: makedirs
makedirs: ${WRKDIR}

${WRKDIR}:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} ${WRKDIR}

# Dependencies
include ${PKGSRCDIR}/mk/depends/depends-vars.mk

# Check
-include "${PKGSRCDIR}/mk/check/bsd.check.mk"

# Clean
include ${PKGSRCDIR}/mk/clean.mk

# Fetch
include ${PKGSRCDIR}/mk/fetch/fetch-vars.mk

# Checksum
include ${PKGSRCDIR}/mk/checksum/checksum-vars.mk

# Extract
include ${PKGSRCDIR}/mk/extract/extract-vars.mk

# Patch
include ${PKGSRCDIR}/mk/patch/patch-vars.mk

# Configure
include ${PKGSRCDIR}/mk/configure/configure-vars.mk

# Build
include ${PKGSRCDIR}/mk/build/build-vars.mk

# Install
include ${PKGSRCDIR}/mk/install/install-vars.mk

# Update
include ${PKGSRCDIR}/mk/update/update-vars.mk

# Package
include ${PKGSRCDIR}/mk/package/package-vars.mk

# Pkg
include ${PKGSRCDIR}/mk/pkg/pkg-vars.mk


# --------------------------------------------------------------------
#
# Some more targets supplied for users' convenience
#

# Run pkglint:
.PHONY: lint
lint:
	${_PKG_SILENT}${_PKG_DEBUG}${LOCALBASE}/bin/pkglint

# List of flags to pass to pkg_add(1) for bin-install:

BIN_INSTALL_FLAGS?= 	# -v
_BIN_INSTALL_FLAGS=	${BIN_INSTALL_FLAGS}
ifneq (,$(isyes _AUTOMATIC))
_BIN_INSTALL_FLAGS+=	-A
endif
_BIN_INSTALL_FLAGS+=	${PKG_ARGS_ADD}

-include "${PKGSRCDIR}/mk/install/bin-install.mk"


################################################################
# Everything after here are internal targets and really
# shouldn't be touched by anybody but the release engineers.
################################################################

# convenience target, to display make variables from command line
# i.e. "make show-var VARNAME=var", will print var's value
.PHONY: show-var
show-var:
	@${ECHO} ${${VARNAME}}


LICENSE_FILE?=		${PKGSRCDIR}/licenses/${LICENSE}

show-license:
	@license=${LICENSE:Q};						\
	license_file=${LICENSE_FILE:Q};					\
	pager=${PAGER:Q};						\
	case "$$pager" in "") pager=${CAT:Q};; esac;			\
	case "$$license" in "") exit 0;; esac;				\
	if ${TEST} -f "$$license_file"; then				\
		$$pager "$$license_file";				\
	else								\
		${ECHO} "Generic $$license information not available";	\
		${ECHO} "See the package description (pkg_info -d ${PKGNAME}) for more information."; \
	fi

include ../../mk/plist/plist-vars.mk

-include "../../mk/bsd.utils.mk"

-include "../../mk/subst.mk"


-include "${PKGSRCDIR}/mk/internal/build-defs-message.mk"
#if make(debug) || make(build-env)
#.include "${PKGSRCDIR}/mk/bsd.pkg.debug.mk"
#.endif
#.if make(help)
#.include "${PKGSRCDIR}/mk/help/help.mk"
#.endif

# fake target to make pattern targets phony
.FORCE:
