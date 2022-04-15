# robotpkg Makefile for:	middleware/py-yarp
# Created:			Severin Lemaignan on Fri, 12 Jun 2009
#

DISTNAME=		yarp-3.4.1
MASTER_SITES=		${MASTER_SITE_GITHUB:=robotology/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

CATEGORIES=		middleware
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

CONFIGURE_DIRS=		${WRKSRC}
BUILD_DIRS=		${WRKSRC}/bindings/python

DEPEND_ABI.cmake=	cmake>=3.12
DEPEND_ABI.python=	python>=3
DEPEND_ABI.swig=	swig>=3.0.12
DEPEND_ABI.yarp=	yarp>=${VERSION}<3.5

include ../../middleware/yarp/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/swig.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
