# $Id: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $

DISTNAME=	blas
PKGNAME=	blas-1.0
PKGREVISION=	3

CATEGORIES=	math
MASTER_SITES= 	ftp://ftp.netlib.org/blas/ \
		ftp://netlib.bell-labs.com/netlib/blas/ \
		ftp://www.hensa.ac.uk/mirrors/netlib/blas/
EXTRACT_SUFX=   .tgz

MAINTAINER=     openrobots@laas.fr
HOMEPAGE=       http://www.netlib.org/blas/
COMMENT=        Basic Linear Algebra Subprograms (Fortran)

WRKSRC=		${WRKDIR}
USE_LANGUAGES=	fortran

INSTALLATION_DIRS=	lib

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
