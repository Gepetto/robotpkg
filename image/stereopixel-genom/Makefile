# $Id: Makefile 2007/11/27 11:43:03 mallet $

DISTNAME=		stereopixel-genom-1.1
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Stereo-vision by pixel correlation - GenoM component

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKG_CONFIG=		yes

include ../../image/libstereopixel/depend.mk
include ../../image/libimages3d/depend.mk
include ../../image/opencv/depend.mk
include ../../mk/robotpkg.mk

# waiting for a more modular solution, hardcode -t
# -o will require transgen
pre-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PREFIX}/bin/genom -t stereopixel
