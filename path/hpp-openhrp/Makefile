# $NetBSD$
#

DISTNAME=	hppopenhrp-${VERSION}
PKGNAME=	hpp-openhrp-${VERSION}
VERSION=	1.2

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with OpenHRP(tm).

DEPENDS+=	hpp-core>=1.3:../../path/hpp-core
DEPENDS+=	jrl-modelloader>=1.2:../../devel/jrl-modelloader
DEPENDS+=	openhrp-jrl>=20060713r6:../../architecture/openhrp-jrl

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX}/OpenHRP

include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
