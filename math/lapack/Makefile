# robotpkg Makefile for:	math/lapack
# Created:			Anthony Mallet on Mon, 29 Jan 2007
#

DISTNAME=	lapack-3.1.0
PKGREVISION=	2

CATEGORIES=	math
MASTER_SITES=\
	http://netlib.org/lapack/		\
	http://netlib.sandia.gov/lapack/	\
	http://www.netlib.no/netlib/lapack/
EXTRACT_SUFX=	.tgz

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.netlib.org/lapack/index.html
COMMENT=	Linear Algebra PACKage.


CMAKE_ARGS+=	-DBLAS_DIR=${PREFIX.blas}/lib
CMAKE_ARGS+=	-DBLAS_LIBRARIES=blas

include ../../math/blas/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk

post-extract:
	${CP} ${FILESDIR}/CMakeLists.txt ${WRKSRC}
