# $Id: Makefile 5aba98d50d4a643141568cabebe7601e 2008/02/16 19:15:04 tho $

DISTNAME=	gmp-4.2.2
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GNU:=gmp/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://gmplib.org/
COMMENT=	Library for arbitrary precision arithmetic

USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-cxx --without-readline
CONFIGURE_ENV+=		ABI=32

include ../../mk/robotpkg.mk
