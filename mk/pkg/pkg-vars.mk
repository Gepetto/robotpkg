# $NetBSD: flavor-vars.mk,v 1.2 2006/10/06 14:51:36 joerg Exp $
#
# This Makefile fragment is included indirectly by bsd.prefs.mk and
# defines some variables which must be defined earlier than where
# flavor.mk is included.
#

# This is the package database directory for the default view.
PKG_DBDIR?=		/var/db/pkg

PKG_ADD_CMD?=		${PKG_TOOLS_BIN}/pkg_add
PKG_ADMIN_CMD?=		${PKG_TOOLS_BIN}/pkg_admin
PKG_CREATE_CMD?=	${PKG_TOOLS_BIN}/pkg_create
PKG_DELETE_CMD?=	${PKG_TOOLS_BIN}/pkg_delete
PKG_INFO_CMD?=		${PKG_TOOLS_BIN}/pkg_info
PKG_VIEW_CMD?=		${PKG_TOOLS_BIN}/pkg_view
LINKFARM_CMD?=		${PKG_TOOLS_BIN}/linkfarm

ifndef PKGTOOLS_VERSION
PKGTOOLS_VERSION!=	${PKG_INFO_CMD} -V 2>/dev/null || echo 20010302
MAKEFLAGS+=		PKGTOOLS_VERSION=${PKGTOOLS_VERSION}
endif

PKG_ADD?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_ADD_CMD} ${PKGTOOLS_ARGS}
PKG_ADMIN?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_ADMIN_CMD} ${PKGTOOLS_ARGS}
PKG_CREATE?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_CREATE_CMD} ${PKGTOOLS_ARGS}
PKG_DELETE?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_DELETE_CMD} ${PKGTOOLS_ARGS}
PKG_INFO?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_INFO_CMD} ${PKGTOOLS_ARGS}
PKG_VIEW?=	${SETENV} ${PKGTOOLS_ENV} ${PKG_VIEW_CMD} ${PKG_VIEW_ARGS}
LINKFARM?=	${LINKFARM_CMD}

# "${_PKG_BEST_EXISTS} pkgpattern" prints out the name of the installed
# package that best matches pkgpattern.  Use this instead of
# "${PKG_INFO} -e pkgpattern" if the latter would return more than one
# package name.
#
_PKG_BEST_EXISTS?=	${PKG_ADMIN} -b -d ${_PKG_DBDIR} -S lsbest

# XXX Leave this here until all uses of this have been purged from the
# XXX public parts of pkgsrc.
# XXX
PKG_BEST_EXISTS=	${_PKG_BEST_EXISTS}

include ${PKGSRCDIR}/mk/pkg/metadata.mk
include ${PKGSRCDIR}/mk/pkg/install.mk
