# robotpkg Makefile for:	image/sift
# Created:			nksallem on Wed, 9 Jun 2010
#

PKGVERSION=		1.1.2
DISTNAME=		sift-${PKGVERSION_NOREV}_20100521
PKGNAME=		sift-${PKGVERSION}
CATEGORIES=		image
MASTER_SITES=		http://web.engr.oregonstate.edu/~hess/downloads/sift/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://web.engr.oregonstate.edu/~hess
COMMENT=		A C implementation of a SIFT image feature detector
LICENSE=		modified-bsd

WRKSRC=			${WRKDIR}/sift

USE_LANGUAGES+=		c c++
USE_PKGLOCALEDIR=	yes

NO_CONFIGURE=           yes

include ../../image/opencv/depend.mk
include ../../mk/sysdep/gtk.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
