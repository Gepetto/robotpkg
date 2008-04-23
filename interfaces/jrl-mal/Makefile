# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	matrixabstractlayer-${VERSION}
PKGNAME=	jrl-mal-${VERSION}
VERSION=	1.4

CATEGORIES=	interfaces
MASTER_SITES=	${MASTER_SITE_JRL}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	matrix abstraction layer for boost or vnl.

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

# options
PKG_SUPPORTED_OPTIONS+=	boost vnl t3d
PKG_SUGGESTED_OPTIONS+=	boost t3d

PKG_OPTION_DESCR.boost=	Use boost for generic NxP matrix implementation
define PKG_OPTION_SET.boost
CONFIGURE_ARGS+=	--with-boost=${PREFIX}
DEPENDS+=	boost-numeric-bindings>=20070129:../../devel/boost-numeric-bindings
DEPENDS+=       lapack>=3.1.0r1:../../math/lapack
endef

PKG_OPTION_DESCR.vnl=	Use vnl for generic NxP matrix implementation
PKG_OPTION_SET.vnl:=	CONFIGURE_ARGS+=	--with-vnl=${PREFIX}

PKG_OPTION_DESCR.t3d=	Use t3d for rigid body transformations
define PKG_OPTION_SET.t3d
CONFIGURE_ARGS+=	--with-t3d
DEPENDS+=		libt3d>=2.5:../../math/t3d
endef

include ../../mk/robotpkg.mk
