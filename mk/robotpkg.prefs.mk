# $NetBSD: bsd.prefs.mk,v 1.241 2006/10/09 12:25:44 joerg Exp $
#
# Make file, included to get the site preferences, if any.  Should
# only be included by package Makefiles before any ifdef
# statements or modifications to "passed" variables (CFLAGS, LDFLAGS, ...),
# to make sure any variables defined in robotpkg.conf or the system
# defaults are used.

ifndef ROBOTPKG_MK

# Let robotpkg.conf know that this is robotpkg.
ROBOTPKG_MK=1
__PREFIX_SET__:=${PREFIX}

# Calculate depth
_PKGSRC_TOPDIR=$(shell 
	if test -f ./mk/robotpkg.prefs.mk; then
		pwd
	elif test -f ../mk/robotpkg.prefs.mk; then
		echo `pwd`/..
	elif test -f ../../mk/robotpkg.prefs.mk; then
		echo `pwd`/../..
	fi)

# include the defaults file
-include "${_PKGSRC_TOPDIR}/mk/defaults/robotpkg.conf"

ifdef PREFIX
ifneq (${PREFIX},${__PREFIX_SET__})
.BEGIN:
	@${ECHO_MSG} "You CANNOT set PREFIX manually or in mk.conf. Set LOCALBASE"
	@${ECHO_MSG} "depending on your needs. See the pkg system documentation for more info."
	@${FALSE}
endif
endif

LOCALBASE?=		/usr/pkg

DEPOT_SUBDIR?=		packages
DEPOTBASE=		${LOCALBASE}/${DEPOT_SUBDIR}

PKGPATH?=		$(shell pwd | sed -e '|.*/([^/]*/[^/]*)$|\1|'}
ifndef _PKGSRCDIR
_PKGSRCDIR=		$(shell cd ${_PKGSRC_TOPDIR} && pwd)
MAKEFLAGS+=		_PKGSRCDIR=${_PKGSRCDIR}
endif
PKGSRCDIR=		${_PKGSRCDIR}

DISTDIR?=		${PKGSRCDIR}/distfiles
PACKAGES?=		${PKGSRCDIR}/packages
TEMPLATES?=		${PKGSRCDIR}/templates

PATCHDIR?=		${CURDIR}/patches
SCRIPTDIR?=		${CURDIR}/scripts
FILESDIR?=		${CURDIR}/files
PKGDIR?=		${CURDIR}

# If WRKOBJDIR is set, use that tree to build
ifdef WRKOBJDIR
BUILD_DIR?=		${WRKOBJDIR}/${PKGPATH}
else
BUILD_DIR=		$(shell cd ${CURDIR} && pwd)
endif

WRKDIR_BASENAME?=	work
WRKDIR?=		${BUILD_DIR}/${WRKDIR_BASENAME}

# There are many uses for a common log file, so define one.
WRKLOG?=		${WRKDIR}/.work.log

PKG_DEFAULT_OPTIONS?=	# empty
PKG_OPTIONS?=		# empty

endif	# ROBOTPKG_MK
