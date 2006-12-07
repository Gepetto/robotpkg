# $NetBSD: bsd.prefs.mk,v 1.241 2006/10/09 12:25:44 joerg Exp $
#
# Make file, included to get the site preferences, if any.  Should
# only be included by package Makefiles before any ifdef
# statements or modifications to "passed" variables (CFLAGS, LDFLAGS, ...),
# to make sure any variables defined in robotpkg.conf or the system
# defaults are used.

ifndef ROBOTPKG_MK
ROBOTPKG_MK=defined
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

# import useful macros
include ${_PKGSRC_TOPDIR}/mk/internal/macros.mk

# boostrap tools
UNAME:=$(call pathsearch,uname,/usr/bin:/bin)
ifeq (,${UNAME})
UNAME=echo Unknown
endif

CUR:=$(call pathsearch,cut,/usr/bin:/bin)
ifeq (,${TR})
CUT=:
endif

TR:=$(call pathsearch,tr,/usr/bin:/bin)
ifeq (,${TR})
TR=:
endif

# compute platform variables
ifndef OPSYS
OPSYS:=			$(shell ${UNAME} -s | ${TR} -d /)
MAKEOVERRIDES+=		OPSYS=${OPSYS}
endif

# Later, recursed make invocations will skip these blocks entirely thanks
# to MAKEFLAGS.
ifndef OS_VERSION
OS_VERSION:=		$(shell ${UNAME} -r)
MAKEOVERRIDES+=		OS_VERSION=${OS_VERSION}
endif
ifndef LOWER_OS_VERSION
LOWER_OS_VERSION:=      $(shell echo ${OS_VERSION} | ${TR} 'A-Z' 'a-z')
MAKEOVERRIDES+=             LOWER_OS_VERSION=${LOWER_OS_VERSION}
endif

ifeq (${OPSYS},"NetBSD")
LOWER_OPSYS?=		netbsd
endif

ifeq (${OPSYS},"Darwin")
LOWER_OPSYS?=		darwin
LOWER_ARCH=		$(shell ${UNAME} -p)
MACHINE_ARCH=           ${LOWER_ARCH}
MAKEOVERRIDES+= 	LOWER_ARCH=${LOWER_ARCH}
endif

ifeq (${OPSYS},"Linux")
LOWER_OPSYS?=		linux
LOWER_ARCH?=		$(shell ${UNAME} -m | sed -e 's/i.86/i386/' -e 's/ppc/powerpc/')
MACHINE_ARCH=           ${LOWER_ARCH}
MAKEOVERRIDES+=		LOWER_ARCH=${LOWER_ARCH}
endif

# include the defaults file

ifndef MAKECONF
  ifdef ROBOTPKG_BASE
_MAKECONF=${ROBOTPKG_BASE}/etc/robotpkg.conf
  else
_MAKECONF=$(shell robotpkg_info -Q PKG_SYSCONFDIR pkg_install)/robotpkg.conf
  endif
else
_MAKECONF=${MAKECONF}
endif
ifneq (yes,$(call exists,${_MAKECONF}))
define msg

ERROR: Unable to find package configuration file in
ERROR:		${_MAKECONF}.
ERROR: Maybe you forgot to set your PATH variable to point to robotpkg_info.
ERROR: You can also define the variable ROBOTPKG_BASE to point to your
ERROR: installation prefix. Finally, you can invoke
ERROR:    ${MAKE} MAKECONF=<robotpkg config file>
endef
$(error $(msg))
endif
include ${_MAKECONF}
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

# Load the OS-specific definitions for program variables.
ifeq (yes,$(call exists,${_PKGSRC_TOPDIR}/mk/platform/${OPSYS}.mk))
  include ${_PKGSRC_TOPDIR}/mk/platform/${OPSYS}.mk
else
PKG_FAIL_REASON+=	"missing mk/platform/${OPSYS}.mk"
endif

LOCALBASE?=		/usr/pkg

DEPOT_SUBDIR?=		packages
DEPOTBASE=		${LOCALBASE}/${DEPOT_SUBDIR}

PKGPATH?=		$(notdir $(patsubst %/,%,$(dir $(CURDIR))))/$(notdir $(CURDIR))
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

# If MAKECONF is defined, then pass it down to all recursive make
# processes invoked by pkgsrc.
#
ifdef MAKECONF
PKGSRC_MAKE_ENV+=       MAKECONF=${MAKECONF}
endif
RECURSIVE_MAKE=         ${SETENV} ${PKGSRC_MAKE_ENV} ${MAKE}

endif	# ROBOTPKG_MK
