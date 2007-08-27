# $NetBSD$
#

DISTNAME=	hppopenhrp-${VERSION}
PKGNAME=	hpp-openhrp-${VERSION}
VERSION=	1.0

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with OpenHRP(tm).

DEPENDS+=	hpp-core>=1.1:../../path/hpp-core
DEPENDS+=	jrl-modelloader>=1.1:../../devel/jrl-modelloader
DEPENDS+=	omniORB>=4.1.0:../../devel/omniORB
DEPENDS+=	openhrp-jrl>=20060713r6:../../architecture/openhrp-jrl

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX}/OpenHRP

include ../../mk/robotpkg.mk
