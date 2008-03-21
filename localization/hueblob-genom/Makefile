# $Id$
#

DISTNAME=		hueblob-genom-0.99
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for simple object detection and localization

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKG_CONFIG=		yes

DEPENDS+=		viam-genom>=0.99:../../image/viam-genom
DEPENDS+=		pom-genom>=0.4:../../localization/pom-genom
DEPENDS+=		stereopixel-genom>=1.1:../../image/stereopixel-genom

CONFIGURE_ARGS+=	--with-display

include ../../image/opencv/depend.mk
include ../../mk/robotpkg.mk

# waiting for a more modular solution, hardcode -t
# -o will require transgen
pre-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PREFIX}/bin/genom -t hueblob
