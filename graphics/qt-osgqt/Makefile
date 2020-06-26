# robotpkg Makefile for:	graphics/qt-osgqt
# Created:			Guilhem Saurel on Mon, 25 May 2020
#

ORG=			gepetto
NAME=			osgQt
VERSION=		3.5.7
DISTNAME=		${VERSION}
PKGNAME=		${PKGTAG.qt-}osgqt-${VERSION}
PKGREVISION=		2

MASTER_SITES=		${MASTER_SITE_GITHUB:=${ORG}/${NAME}}/archive/
WRKSRC=			${WRKDIR}/${NAME}-${DISTNAME}

CATEGORIES=		graphics
COMMENT=		open source high performance 3D graphics toolkit
LICENSE=		gnu-lgpl-v2.1
MAINTAINER=		gsaurel@laas.fr

CMAKE_ARGS+=		-DDESIRED_QT_VERSION=${QT_SELECT}
CMAKE_ARGS+=		-DLIB_POSTFIX=""
CMAKE_PREFIX_PATH=	${PREFIX.openscenegraph}

PLIST_QTSUFFX=		Qt$(subst 4,,${QT_SELECT})
PLIST_SUBST+=		PLIST_QTSUFFX=${PLIST_QTSUFFX}

DEPEND_ABI.openscenegraph=	openscenegraph>=3.5.6

# Qt4 requires more tweaks
include ../../mk/sysdep/qt.mk
define PKG_ALTERNATIVE_SET.qt4 +=

  include ../../mk/sysdep/qmake.mk
  CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}
endef

include ../../graphics/openscenegraph/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
