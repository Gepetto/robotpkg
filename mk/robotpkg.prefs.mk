# $NetBSD: bsd.prefs.mk,v 1.241 2006/10/09 12:25:44 joerg Exp $
#
# Make file, included to get the site preferences, if any.  Should
# only be included by package Makefiles before any ifdef
# statements or modifications to "passed" variables (CFLAGS, LDFLAGS, ...),
# to make sure any variables defined in robotpkg.conf or the system
# defaults are used.

ifndef ROBOTPKG_MK

__PREFIX_SET__:=${PREFIX}

# Calculate depth
_PKGSRC_TOPDIR=$(shell \
	if test -f ./mk/robotpkg.mk; then	\
		pwd;				\
	elif test -f ../mk/robotpkg.mk; then	\
		echo `pwd`/..;			\
	elif test -f ../../mk/robotpkg.mk; then	\
		echo `pwd`/../..;		\
	fi)

# include the defaults file
include ${_PKGSRC_TOPDIR}/mk/internal/macros.mk

ifndef MAKECONF
MAKECONF=$(shell robotpkg_info -Q PKG_SYSCONFDIR pkg_install)/robotpkg.conf
endif
ifneq (yes,$(call exists,${MAKECONF}))
define msg

ERROR: Unable to find package configuration file in
ERROR:		${MAKECONF}.
ERROR: Maybe you forgot to set your PATH variable to point to robotpkg_info.
ERROR: Try to invoke ${MAKE} MAKECONF=<path to robotpkg config file>
endef
$(error $(msg))
endif
include ${MAKECONF}
include ${_PKGSRC_TOPDIR}/mk/defaults/robotpkg.conf

ifdef PREFIX
ifneq (${PREFIX},${__PREFIX_SET__})
define msg

ERROR: You CANNOT set PREFIX manually or in mk.conf. Set LOCALBASE
ERROR: depending on your needs. See the pkg system documentation for
ERROR: more info.
endef
$(error $(msg))
endif
endif

LOCALBASE?=		/usr/pkg

DEPOT_SUBDIR?=		packages
DEPOTBASE=		${LOCALBASE}/${DEPOT_SUBDIR}

PKGPATH?=		$(notdir $(patsubst %/,%,$(dir $(shell pwd))))/$(notdir $(shell pwd))
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

# Standard commands
TRUE?=			:
FALSE?=			false
SETENV?=		env
TEST?=			test
LS?=			ls
LN?=			ln
ECHO?=			echo
CAT?=			cat
SED?=			sed
CP?=			cp
MV?=			mv
RM?=			rm
MKDIR?=			mkdir -p
DATE?=			date
SORT?=			sort
AWK?=			awk
MD5?=			md5sum
XARGS?=			xargs -r
SH?=			sh
ID?=			id
GREP?=			grep
TOUCH?=			touch
CHMOD?=			chmod
EXPR?=			expr

TOOLS_INSTALL=		install
DEF_UMASK?=		0022


endif	# ROBOTPKG_MK
