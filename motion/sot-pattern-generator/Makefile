# robotpkg Makefile for:	motion/sot-pattern-generator
# Created:			Olivier Stasse on Thu, 18 Apr 2013
#

VERSION=		2.9.1

DISTNAME=		sot-pattern-generator-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-pattern-generator/}
MASTER_REPOSITORY=\
	${MASTER_REPOSITORY_GITHUB}stack-of-tasks/sot-pattern-generator/

MAINTAINER=		gepetto@laas.fr
CATEGORIES=		motion
COMMENT=		Walking Pattern Generator
LICENSE=		gnu-lgpl-v3

DYNAMIC_PLIST_DIRS+=	share/doc/sot-pattern-generator

CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}
CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

include ../../path/jrl-walkgen/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../math/jrl-dynamics-urdf/depend.mk
include ../../motion/sot-core/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
