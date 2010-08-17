# robotpkg Makefile for:	math/lapack
# Created:			Anthony Mallet on Mon, 29 Jan 2007
#

DISTNAME=	lapack-3.1.0
PKGREVISION=	2

CATEGORIES=	math
MASTER_SITES=	ftp://ftp.netlib.org/lapack/			\
		ftp://netlib.bell-labs.com/netlib/lapack/	\
		ftp://www.hensa.ac.uk/mirrors/netlib/lapack/	\
		ftp://netlib.no/netlib/lapack/			\
		ftp://ftp.zib.de/netlib/lapack/
EXTRACT_SUFX=	.tgz

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.netlib.org/lapack/index.html
COMMENT=	Linear Algebra PACKage.

USE_LANGUAGES+=	fortran

CMAKE_ARGS+=	-DBLAS_DIR=${PREFIX.blas}/lib
CMAKE_ARGS+=	-DBLAS_LIBRARIES=blas

include ../../math/blas/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk

post-extract:
	${CP} ${FILESDIR}/CMakeLists.txt ${WRKSRC}
