# robotpkg Makefile for:	graphics/qt-qgv
# Created:			Guilhem Saurel on Thu, 24 Jan 2019
#

ORG=			gepetto
NAME=			qgv
VERSION=		1.2.0

DISTNAME=		${NAME}-${VERSION}
PKGNAME=		${PKGTAG.qt-}${DISTNAME}

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${NAME}/}
MASTER_REPOSITORY=	git https://github.com/${ORG}/${NAME}.git
CHECKOUT_VCS_OPTS+=	--recursive

CATEGORIES=		graphics
COMMENT=		Interactive Qt graphViz display
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gsaurel@laas.fr

CONFLICTS+=		qt[0-9]-qgv-[0-9]*

USE_QMAKE=		no

USE_QT5_COMPONENTS=	core tools

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib
CMAKE_ARGS+=	-DBINDINGS_$(subst qt,QT,${PKG_ALTERNATIVE.qt})=ON
CMAKE_ARGS+=	-DQT_QMAKE_EXECUTABLE=${QMAKE}
CMAKE_ARGS+=	-DGRAPHVIZ_INCLUDE_DIR=${PREFIX.graphviz}/include/graphviz

DYNAMIC_PLIST_DIRS+=	share/doc/${NAME}

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/qt.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
