# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	lapack-3.1.0
PKGREVISION=	1

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

USE_LIBTOOL=		yes
USE_LANGUAGES=		fortran

BUILD_TARGET=		lapacklib

INSTALLATION_DIRS=	lib

include ../../math/blas/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${LIBTOOL} --mode=install ${INSTALL_DATA} ${WRKSRC}/liblapack.la \
		${PREFIX}/lib
