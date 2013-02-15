# robotpkg Makefile for:	math/blas
# Created:			Anthony Mallet on Thu, 22 Feb 2007
#

DISTNAME=	blas
PKGNAME=	blas-3.1.0

CATEGORIES=	math
MASTER_SITES=\
	http://spacehopper.org/mirrors/blas-20110419/	\
	http://netlib.org/blas/				\
	http://netlib.sandia.gov/blas/
EXTRACT_SUFX=   .tgz

MAINTAINER=     openrobots@laas.fr
HOMEPAGE=       http://www.netlib.org/blas/
COMMENT=        Basic Linear Algebra Subprograms (Fortran)

WRKSRC=		${WRKDIR}/BLAS


include ../../mk/sysdep/cmake.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk

post-extract:
	${CP} ${FILESDIR}/CMakeLists.txt ${WRKSRC}
