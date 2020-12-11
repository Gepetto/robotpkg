# robotpkg Makefile for:	middleware/py-yarp
# Created:			Severin Lemaignan on Fri, 12 Jun 2009
#

VERSION=		3.4.1
PKGNAME=		${PKGTAG.python-}yarp-${VERSION}
DISTNAME=		v${VERSION}
CATEGORIES=		middleware
MASTER_SITES=		https://github.com/robotology/yarp/archive/
DIST_SUBDIR=		yarp

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://www.yarp.it/
COMMENT=		Python bindings for YARP
LICENSE=		modified-bsd

CMAKE_ARGS+=		-DYARP_COMPILE_BINDINGS=TRUE
CMAKE_ARGS+=		-DCREATE_PYTHON=TRUE
CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_PATH=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

CMAKE_ARGS+=		-DYARP_COMPILE_GUIS=FALSE
CMAKE_ARGS+=		-DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
CMAKE_ARGS+=		-DCMAKE_DISABLE_FIND_PACKAGE_Libedit=TRUE

WRKSRC=			${WRKDIR}/yarp-${VERSION}
CONFIGURE_DIRS=		${WRKSRC}
BUILD_DIRS=		${WRKSRC}/bindings/python

DEPEND_ABI.cmake=	cmake>=3.12
DEPEND_ABI.python=	python>=3
DEPEND_ABI.swig=	swig>=3.0.12
DEPEND_ABI.yarp=	yarp>=${VERSION}<3.5

include ../../devel/swig/depend.mk
include ../../middleware/yarp/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
