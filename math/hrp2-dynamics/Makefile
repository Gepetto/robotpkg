# $Id: Makefile 2008/02/18 15:54:51 mallet $

DISTNAME=	hrp2dynamics-${VERSION}
PKGNAME=	hrp2-dynamics-${VERSION}
VERSION=	1.0

CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_JRL}
NO_PUBLIC_SRC=	yes

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Optimized implementation of functions related to HRP-2 dynamics.

DEPENDS+=	jrl-dynamics>=1.7:../../math/jrl-dynamics

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes
USE_LIBTOOL=	yes

include ../../mk/robotpkg.mk
