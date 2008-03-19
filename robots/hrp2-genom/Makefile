# $Id$
#

DISTNAME=	hrp2-genom-0.1

CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Basic HRP-2 hardware control - GenoM component

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

DEPENDS+=	netshring>=1.0:../../architecture/netshring
DEPENDS+=	t3d>=2.5:../../math/t3d
DEPENDS+=	pom-genom>=0.4:../../localization/pom-genom

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.openhrp-jrl}/OpenHRP

include ../../architecture/openhrp-jrl/depend.mk
include ../../architecture/genom-openhrp-plugin/depend.mk
include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk

# waiting for a more modular solution, hardcode -t
# -o will require transgen
pre-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PREFIX}/bin/genom -t hrp2
