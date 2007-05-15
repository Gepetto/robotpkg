# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	matrixabstractlayer-${VERSION}
PKGNAME=	jrl-mal-${VERSION}
VERSION=	1.2
#PKGREVISION=	0

CATEGORIES=	interfaces
MASTER_SITES=	${MASTER_SITES_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	matrix abstraction layer for boost or vnl.

DEPENDS+=	boost-numeric-bindings>=20070129:../../devel/boost-numeric-bindings
DEPENDS+=       lapack>=3.1.0:../../math/lapack
DEPENDS+=       libt3d>=2.2:../../math/t3d

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

CONFIGURE_ARGS+=	--with-boost=${PREFIX}
CONFIGURE_ARGS+=	--with-lapack=${PREFIX}
CONFIGURE_ARGS+=	--with-t3d

include ../../mk/robotpkg.mk
