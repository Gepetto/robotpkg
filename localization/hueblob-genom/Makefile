# $Id$
#

DISTNAME=		hueblob-genom-1.0
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for simple object detection and localization

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKG_CONFIG=		yes

CONFIGURE_ARGS+=	--with-display

GENOM_MODULE=		hueblob
include ../../architecture/genom/depend.mk

include ../../image/viam-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../image/opencv/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
