# robotpkg Makefile for:	graphics/qt-qgv
# Created:			Guilhem Saurel on Thu, 24 Jan 2019
#

ORG=			gepetto
NAME=			qgv
VERSION=		1.3.1
PKGREVISION=		1

PKGNAME=		${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics
COMMENT=		Interactive Qt graphViz display
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gsaurel@laas.fr

CONFLICTS+=		qt[0-9]-qgv-[0-9]*

USE_QMAKE=		no

USE_QT5_COMPONENTS=	core tools

CMAKE_ARGS+=		-DBINDINGS_$(subst qt,QT,${PKG_ALTERNATIVE.qt})=ON
CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}
CMAKE_ARGS+=		-DGRAPHVIZ_INCLUDE_DIR=${PREFIX.graphviz}/include/graphviz

include ../../devel/jrl-cmakemodules/Makefile.common
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/libgraphviz.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/qt.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
