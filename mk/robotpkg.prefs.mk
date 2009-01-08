# $LAAS: robotpkg.prefs.mk 2009/01/08 11:11:32 mallet $
#
# Copyright (c) 2006-2009 LAAS/CNRS
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

# calculate depth
ifndef _ROBOTPKG_DIR
  _ROBOTPKG_DIR:=$(firstword $(realpath \
	$(dir $(realpath $(addsuffix /mk/robotpkg.mk,. .. ../..)))/..))
  MAKEOVERRIDES+=	_ROBOTPKG_DIR=${_ROBOTPKG_DIR}
endif
ROBOTPKG_DIR=	${_ROBOTPKG_DIR}

# import useful macros
include ${ROBOTPKG_DIR}/mk/internal/macros.mk

# boostrap tools
UNAME:=$(call pathsearch,uname,/usr/bin:/bin)
ifeq (,${UNAME})
UNAME=echo Unknown
endif

CUT:=$(call pathsearch,cut,/usr/bin:/bin)
ifeq (,${CUT})
CUT=:
endif

TR:=$(call pathsearch,tr,/usr/bin:/bin)
ifeq (,${TR})
TR=:
endif

# Compute platform variables. Later, recursed make invocations will skip these
# blocks entirely thanks to MAKEOVERRIDES.
ifndef OPSYS
OPSYS:=			$(shell ${UNAME} -s | ${TR} -d /)
LOWER_OPSYS?=		$(shell echo ${OPSYS} | ${TR} 'A-Z' 'a-z')
MAKEOVERRIDES+=		OPSYS=${OPSYS} LOWER_OPSYS=${LOWER_OPSYS}
endif

ifndef OS_VERSION
OS_VERSION:=		$(shell ${UNAME} -r)
LOWER_OS_VERSION:=	$(shell echo ${OS_VERSION} | ${TR} 'A-Z' 'a-z')
MAKEOVERRIDES+=		LOWER_OS_VERSION=${LOWER_OS_VERSION}
MAKEOVERRIDES+=		OS_VERSION=${OS_VERSION}
endif

ifndef MACHINE_ARCH
LOWER_ARCH:=		$(shell ${UNAME} -m | sed -e 's/i.86/i386/' -e 's/ppc/powerpc/')
MACHINE_ARCH=           ${LOWER_ARCH}
MAKEOVERRIDES+=		LOWER_ARCH=${LOWER_ARCH} MACHINE_ARCH=${MACHINE_ARCH}
endif

ifndef NODENAME
NODENAME:=		$(shell ${UNAME} -n)
MAKEOVERRIDES+=		NODENAME=${NODENAME}
endif


# include the defaults file
#
ifndef MAKECONF
  ifdef ROBOTPKG_BASE
_MAKECONF=${ROBOTPKG_BASE}/etc/robotpkg.conf
  else
   ifneq (,$(call pathsearch,robotpkg_info,${PATH}))
_MAKECONF=$(shell robotpkg_info -Q PKG_SYSCONFDIR pkg_install)/robotpkg.conf
   else
_MAKECONF=/opt/openrobots/etc/robotpkg.info
   endif
  endif
else
_MAKECONF=${MAKECONF}
endif
-include ${_MAKECONF}
include ${ROBOTPKG_DIR}/mk/robotpkg.default.conf


# load the OS-specific definitions for program variables.
#
ifeq (yes,$(call exists,${ROBOTPKG_DIR}/mk/platform/${OPSYS}.mk))
  include ${ROBOTPKG_DIR}/mk/platform/${OPSYS}.mk
else
  PKG_FAIL_REASON+=	"missing mk/platform/${OPSYS}.mk"
endif

LOCALBASE?=		/opt/openrobots

DEPOT_SUBDIR?=		packages
DEPOTBASE=		${LOCALBASE}/${DEPOT_SUBDIR}

PKGPATH?=		$(subst $(realpath ${CURDIR}/../..)/,,$(realpath ${CURDIR}))

DISTDIR?=		${ROBOTPKG_DIR}/distfiles
PACKAGES?=		${ROBOTPKG_DIR}/packages
TEMPLATES?=		${ROBOTPKG_DIR}/templates

PATCHDIR?=		${CURDIR}/patches
SCRIPTDIR?=		${CURDIR}/scripts
FILESDIR?=		${CURDIR}/files
PKGDIR?=		${CURDIR}

# A meta-package is a package that does not have any files and whose only
# purpose is to depend on other packages, giving that collection a simple
# name. This variable must be set before including robotpkg.prefs.mk
# directly or indirectly.
ifdef META_PACKAGE
NO_CHECKSUM=		yes
NO_CONFIGURE=           yes
NO_BUILD=               yes
DISTFILES=              # none
PLIST_SRC=              # none
do-install do-patch:
	@${DO_NADA}
endif


# If WRKOBJDIR is set, use that tree to build
ifdef WRKOBJDIR
BUILD_DIR?=		${WRKOBJDIR}/${PKGPATH}
else
BUILD_DIR=		$(realpath ${CURDIR})
endif

WRKDIR_BASENAME?=	work
WRKDIR?=		${BUILD_DIR}/${WRKDIR_BASENAME}

# There are many uses for a common log file, so define one.
WRKLOG?=		${WRKDIR}/.work.log

PKG_DEFAULT_OPTIONS?=	# empty
PKG_OPTIONS?=		# empty

# If MAKECONF is defined, then pass it down to all recursive make
# processes invoked by robotpkg.
#
ifdef MAKECONF
PKGSRC_MAKE_ENV+=       MAKECONF=${MAKECONF}
endif
RECURSIVE_MAKE=         ${SETENV} ${PKGSRC_MAKE_ENV} ${MAKE}
MAKEFLAGS+=		--no-print-directory

endif # MK_ROBOTPKG_PREFS
