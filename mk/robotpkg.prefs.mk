#
# Copyright (c) 2006-2012 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
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
# From $NetBSD: bsd.prefs.mk,v 1.241 2006/10/09 12:25:44 joerg Exp $
#
#                                      Anthony Mallet on Wed Nov  8 2006
#

# Make file, included to get the site preferences, if any. Should only be
# included by package Makefiles before any ifdef statements or
# modifications to "passed" variables (CFLAGS, LDFLAGS, ...), to make
# sure any variables defined in robotpkg.conf or the system defaults are
# used.

ifndef MK_ROBOTPKG_PREFS
MK_ROBOTPKG_PREFS:=	defined

# detect obsolete/not working gmake
ifneq (,$(filter 3.80,${MAKE_VERSION}))
  $(error robotpkg requires GNU-make>=3.81)
endif

# compute ROBOTPKG_DIR
ifndef ROBOTPKG_DIR
  export ROBOTPKG_DIR:=$(firstword $(realpath \
	$(dir $(realpath $(addsuffix /mk/robotpkg.mk,. .. ../..)))/..))
endif

# calculate depth
_ROBOTPKG_DEPTH:=$(words $(subst /, ,$(subst ${ROBOTPKG_DIR},,$(realpath .))))

# import useful macros
include ${ROBOTPKG_DIR}/mk/internal/macros.mk

# compute PKGPATH
ifeq (2,${_ROBOTPKG_DEPTH})
  PKGPATH?=$(call pkgpath,${CURDIR})
endif

# clean unwanted environment variables and apply local settings defined by
# parent make invocations
include ${ROBOTPKG_DIR}/mk/internal/env.mk

# find uname location
ifndef UNAME
  UNAME:=$(call pathsearch,uname,/usr/bin:/bin)
  ifeq (,${UNAME})
    UNAME:=echo Unknown
  endif
endif


# Compute platform variables. Later, recursed make invocations will skip these
# blocks entirely
#
ifndef MACHINE_PLATFORM
  _uname:=$(shell UNAME=${UNAME} ${SHELL} ${ROBOTPKG_DIR}/mk/platform/opsys.sh)
  _kernel:=$(shell ${UNAME} -srn)

  export OPSYS:=		$(word 1,${_uname})
  export LOWER_OPSYS:=		$(call tolower,${OPSYS})
  _ENV_VARS+=			OPSYS LOWER_OPSYS

  export OS_VERSION:=		$(word 2,${_uname})
  export LOWER_OS_VERSION:=	$(call tolower,${OS_VERSION})
  _ENV_VARS+=			LOWER_OS_VERSION OS_VERSION

  export MACHINE_ARCH:=		$(word 3,${_uname})
  export LOWER_ARCH:=		${LOWER_ARCH}
  _ENV_VARS+=			MACHINE_ARCH LOWER_ARCH

  export OS_KERNEL:=		$(word 1,${_kernel})
  export OS_KERNEL_VERSION:=	$(word 3,${_kernel})
  _ENV_VARS+=			OS_KERNEL OS_KERNEL_VERSION

  export NODENAME:=		$(word 2,${_kernel})
  _ENV_VARS+=			NODENAME

  MACHINE_PLATFORM?=	${OPSYS}-${OS_VERSION}-${MACHINE_ARCH}
  MACHINE_KERNEL?=	${OS_KERNEL}-${OS_KERNEL_VERSION}-${MACHINE_ARCH}
endif # MACHINE_PLATFORM


# Load the OS-specific definitions for program variables. Look for OPSYS first
# and fallback on OS_KERNEL.
#
ifeq (yes,$(call exists,${ROBOTPKG_DIR}/mk/platform/${OPSYS}.mk))
  include ${ROBOTPKG_DIR}/mk/platform/${OPSYS}.mk
else ifeq (yes,$(call exists,${ROBOTPKG_DIR}/mk/platform/${OS_KERNEL}.mk))
  include ${ROBOTPKG_DIR}/mk/platform/${OS_KERNEL}.mk
else
  $(error missing mk/platform/${OPSYS}.mk)
endif


# default accepted licenses (defined here so that += operator in robotpkg.conf
# can be used to include the default list). See robotpkg.default.conf for
# details.
#
ACCEPTABLE_LICENSES?=	${DEFAULT_ACCEPTABLE_LICENSES}


# --- Include user configuration and the defaults file ---------------------
#
ifndef ROBOTPKG_BASE
  _robotpkg_info:=$(call pathsearch,robotpkg_info,${PATH}:/opt/openrobots/sbin)
  ifeq (,$(_robotpkg_info))
    $(info ===============================================================)
    $(info The robotpkg_info tool could not be found in:)
    $(info $(empty)	PATH = $(or ${PATH},(empty)))
    $(info )
    $(info Did you run robotpkg/bootstrap/bootstrap?)
    $(info )
    $(info If so, please make sure that <prefix>/sbin is in your PATH or)
    $(info that you have set the ROBOTPKG_BASE variable to <prefix> in)
    $(info your environment.)
    $(info )
    $(info Note: <prefix> is the installation prefix that you configured)
    $(info during the bootstrap of robotpkg.)
    $(info ===============================================================)
    $(error Fatal error)
  endif
else
  _robotpkg_info:=$(wildcard ${ROBOTPKG_BASE}/sbin/robotpkg_info)
  ifeq (,$(_robotpkg_info))
    $(info ===============================================================)
    $(info The robotpkg_info tool could not be found in:)
    $(info $(empty)	ROBOTPKG_BASE = $(or ${ROBOTPKG_BASE},(empty)))
    $(info )
    $(info Did you run robotpkg/bootstrap/bootstrap?)
    $(info ===============================================================)
    $(error Fatal error)
  endif
endif
ifndef ROBOTPKG_BASE
  export ROBOTPKG_BASE:=$(shell ${_robotpkg_info} -Q PREFIX pkg_install)
  ifeq (,${ROBOTPKG_BASE})
    $(info =============================================================)
    $(info The ${_robotpkg_info} tool is not working)
    $(info )
    $(info You may have to (re)run the robotpkg/bootstrap/bootstrap)
    $(info script in order to fix this problem.)
    $(info =============================================================)
    $(error Cannot run ${_robotpkg_info})
  endif
endif
ifndef MAKECONF
  MAKECONF=${ROBOTPKG_BASE}/etc/robotpkg.conf
endif
-include ${MAKECONF}
include ${ROBOTPKG_DIR}/mk/robotpkg.default.conf


# --- Transform package Makefile variables and set defaults ----------------
#
# Make sure to use $(eval) and $(value) here to avoid early expansion of
# variable references that may be part of PKGNAME and PKGVERSION. The idea is
# to assign PKGNAME and PKGVERSION defined in the package to their _NOREV
# version before redefining PKGNAME and PKGVERSION from the later.
#

# [_]PKGREVISION is the local package version [prefixed with r or empty]
PKGREVISION?=
_pkgrevision=		$(addprefix r,$(filter-out 0,$(strip ${PKGREVISION})))

# _pkgtag is the '~' suffix of the package name (list of options)
_pkgtag=		$(addprefix ~,$(call concat,$(sort ${PKG_OPTIONS}),+))

# PKGNAME[_NOREV,_NOTAG] is the package name with version [without revision
# number, without tag],
PKGNAME?=		${DISTNAME}
$(eval PKGNAME_NOREV=	$$(patsubst %$${_pkgrevision},%,$$(patsubst	\
				    %$${_pkgtag},%,$(value PKGNAME))))
PKGNAME_NOTAG=		${PKGNAME_NOREV}${_pkgrevision}
PKGNAME=		${PKGNAME_NOTAG}${_pkgtag}

# PKGVERSION[_NOREV] is the package version number [without revision number].
PKGVERSION?=		$(lastword $(subst -, ,${PKGNAME_NOTAG}))
$(eval PKGVERSION_NOREV=$$(patsubst %$${_pkgrevision},%,$(value PKGVERSION)))
PKGVERSION_NOTAG=	${PKGVERSION_NOREV}${_pkgrevision}
PKGVERSION=		${PKGVERSION_NOTAG}${_pkgtag}

# PKGBASE is the package name without version information,
PKGBASE?=		$(patsubst %-${PKGVERSION_NOREV},%,${PKGNAME_NOREV})

# PKGWILDCARD is a pkg_install wildcard matching all versions of the package.
PKGWILDCARD?=		${PKGBASE}-[0-9]*

# DISTNAME is the distribution archive name. It might not be empty.
ifeq (,$(DISTNAME))
  PKG_FAIL_REASON+='DISTNAME is mandatory.'
endif

# CATEGORIES shall contain at least one category.
ifeq (,$(CATEGORIES))
  PKG_FAIL_REASON+='CATEGORIES are mandatory.'
endif

# COMMENT is a brief description of the package. DESCR_SRC a file containing
# the long description.
COMMENT?=		(no description)
DESCR_SRC?=		${PKGDIR}/DESCR

# MAINTAINER is the person in charge of maintaining the robotpkg package.
MAINTAINER?=		openrobots@laas.fr

# WRKSRC is the directory within WRKDIR where the package extracts itself.
WRKSRC?=		${WRKDIR}/${DISTNAME}

# PKG_SYSCONFDIR is where package's config file go.
ifdef PKG_SYSCONFSUBDIR
  PKG_SYSCONFDIR=	${PKG_SYSCONFBASE}/${PKG_SYSCONFSUBDIR}
else
  PKG_SYSCONFDIR=	${PKG_SYSCONFBASE}
endif

INTERACTIVE_STAGE?=	none
USE_LANGUAGES?=		c # most packages need a C compiler

# Default to building for supported platforms only.
ifeq (undefined,$(origin ONLY_FOR_PLATFORM))
  ifeq (undefined,$(origin NOT_FOR_PLATFORM))
    ONLY_FOR_PLATFORM?=	Linux-% NetBSD-%-i386
  endif
endif

# A meta-package is a package that does not have any files and whose only
# purpose is to depend on other packages, giving that collection a simple
# name. This variable must be set before including robotpkg.prefs.mk
# directly or indirectly.
ifdef META_PACKAGE
NO_CHECKSUM=		yes
NO_EXTRACT=		yes
NO_CONFIGURE=           yes
NO_BUILD=               yes
DISTFILES=#		none
PATCHDIR=		/nonexistent
PLIST_SRC=#		none
USE_LANGUAGES=#		none
LICENSE=		meta-pkg
WRKSRC=			${WRKDIR}
do-patch do-install:
	@${DO_NADA}
endif

PATH:=			$(call prependpath,${LOCALBASE}/sbin,${PATH})
PATH:=			$(call prependpath,${LOCALBASE}/bin,${PATH})
export PATH

PREFIX?=		${LOCALBASE}
ALL_ENV+=		PREFIX=$(call quote,${PREFIX})

DEPOT_SUBDIR?=		packages
DEPOTBASE=		${LOCALBASE}/${DEPOT_SUBDIR}

DISTDIR?=		${ROBOTPKG_DIR}/distfiles
PACKAGES?=		${ROBOTPKG_DIR}/packages
TEMPLATES?=		${ROBOTPKG_DIR}/mk/templates

PATCHDIR?=		${CURDIR}/patches
SCRIPTDIR?=		${CURDIR}/scripts
FILESDIR?=		${CURDIR}/files
PKGDIR?=		${CURDIR}


# If WRKOBJDIR is set, use that tree to build
ifdef WRKOBJDIR
BUILD_DIR?=		${WRKOBJDIR}/${PKGPATH}
else
BUILD_DIR=		$(realpath ${CURDIR})
endif

# If OBJHOSTNAME is set, use hostname in directory name.
# If OBJMACHINE is set, use ${MACHINE_PLATFORM} in the working directory name.
#
ifneq (,$(call isyes,${OBJHOSTNAME}))
 WRKDIR_BASENAME?=	work.${NODENAME}
else ifneq (,$(call isyes,${OBJMACHINE}))
 WRKDIR_BASENAME?=	work.${OPSYS}-${MACHINE_ARCH}
else
 WRKDIR_BASENAME?=	work
endif
WRKDIR?=		${BUILD_DIR}/${WRKDIR_BASENAME}

# There are many uses for a common log file, so define one.
WRKLOG?=		${WRKDIR}/.work.log

PKG_DEFAULT_OPTIONS?=	# empty
PKG_OPTIONS?=		# empty

# Package dependency information
_ALTERNATIVES_FILE=	${WRKDIR}/.alternatives
_SYSDEPENDS_FILE=	${WRKDIR}/.sysdepends
_DEPENDS_FILE=		${WRKDIR}/.depends
_SYSBSDEPENDS_FILE=	${WRKDIR}/.sysbsdepends
_BSDEPENDS_FILE=	${WRKDIR}/.bsdepends
include $(realpath ${_ALTERNATIVES_FILE})
include $(realpath ${_SYSBSDEPENDS_FILE} ${_SYSDEPENDS_FILE})
include $(realpath ${_BSDEPENDS_FILE} ${_DEPENDS_FILE})

endif # MK_ROBOTPKG_PREFS
