# robotpkg Makefile for:	math/lapack
# Created:			Anthony Mallet on Mon, 29 Jan 2007
#

DISTNAME=	lapack-3.7.0

CATEGORIES=	math
MASTER_SITES=	http://netlib.org/lapack/
EXTRACT_SUFX=	.tgz

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.netlib.org/lapack/index.html
COMMENT=	Linear Algebra PACKage.
LICENSE=	modified-bsd

CMAKE_ARGS+=	-DBLAS_FOUND=FALSE
CMAKE_ARGS+=	-DPYTHONINTERP_FOUND=FALSE
CMAKE_ARGS+=	-DBUILD_TESTING=OFF
CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib

CONFIGURE_DIRS=	${WRKSRC}/build
CMAKE_ARG_PATH=	..

include ../../mk/sysdep/cmake.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN}${MKDIR} ${CONFIGURE_DIRS}
