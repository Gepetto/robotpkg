# $NetBSD$
#

DISTNAME=	hppcorbaserver-${VERSION}
PKGNAME=	hpp-corbaserver-${VERSION}
VERSION=	1.3

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Corba interface with hppCore package.

DEPENDS+=	hpp-core>=1.3:../../path/hpp-core

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

# options
PKG_SUPPORTED_OPTIONS+=	openhrp
PKG_SUGGESTED_OPTIONS+=	openhrp

PKG_OPTION_DESCR.openhrp=	Build an OpenHRP(tm) client.
define PKG_OPTION_SET.openhrp
CONFIGURE_ARGS+=	--with-openhrp
DEPENDS+=		hpp-openhrp>=1.1:../../path/hpp-openhrp
DEPENDS+=		jrl-modelloader>=1.2:../../devel/jrl-modelloader
DEPENDS+=		hrp2-dynamics>=1.0:../../math/hrp2-dynamics
DEPENDS+=		hrp2_14>=1.0:../../robots/hrp2-14
endef

include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
