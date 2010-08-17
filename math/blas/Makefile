# robotpkg Makefile for:	math/blas
# Created:			Anthony Mallet on Thu, 22 Feb 2007
#

DISTNAME=	blas
PKGNAME=	blas-3.1.0

CATEGORIES=	math
MASTER_SITES= 	ftp://ftp.netlib.org/blas/ \
		ftp://netlib.bell-labs.com/netlib/blas/ \
		ftp://www.hensa.ac.uk/mirrors/netlib/blas/
EXTRACT_SUFX=   .tgz

MAINTAINER=     openrobots@laas.fr
HOMEPAGE=       http://www.netlib.org/blas/
COMMENT=        Basic Linear Algebra Subprograms (Fortran)

WRKSRC=		${WRKDIR}/BLAS

USE_LANGUAGES+=	fortran

include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk

post-extract:
	${CP} ${FILESDIR}/CMakeLists.txt ${WRKSRC}
