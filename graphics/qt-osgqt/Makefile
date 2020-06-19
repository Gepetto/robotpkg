# robotpkg Makefile for:	graphics/qt-osgqt
# Created:			Guilhem Saurel on Mon, 25 May 2020
#

ORG=			gepetto
NAME=			osgQt
VERSION=		3.5.7
DISTNAME=		${VERSION}
PKGNAME=		${PKGTAG.qt-}osgqt-${VERSION}
PKGREVISION=		1

MASTER_SITES=		${MASTER_SITE_GITHUB:=${ORG}/${NAME}}/archive/
WRKSRC=			${WRKDIR}/${NAME}-${DISTNAME}

CATEGORIES=		graphics
COMMENT=		open source high performance 3D graphics toolkit
LICENSE=		gnu-lgpl-v2.1
MAINTAINER=		gsaurel@laas.fr

CMAKE_ARGS+=		-DDESIRED_QT_VERSION=${QT_SELECT}
CMAKE_ARGS+=		-DLIB_POSTFIX=""
CMAKE_PREFIX_PATH=	${PREFIX.openscenegraph}

PLIST_SRC+=		${PKGDIR}/PLIST
PLIST_SRC+=		${PKGDIR}/PLIST.${PKG_ALTERNATIVE.qt}

include ../../graphics/openscenegraph/depend.mk
include ../../mk/sysdep/qt.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
