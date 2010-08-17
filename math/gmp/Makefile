# robotpkg Makefile for:	math/gmp
# Created:			Anthony Mallet on Thu, 28 Feb 2008
#

DISTNAME=	gmp-4.2.2
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GNU:=gmp/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://gmplib.org/
COMMENT=	Library for arbitrary precision arithmetic

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-cxx --without-readline
CONFIGURE_ENV+=		ABI=32

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
