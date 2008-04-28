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

GENOM_MODULE=		stereopixel	
include ../../architecture/genom/depend.mk

include ../../image/libstereopixel/depend.mk
include ../../image/libimages3d/depend.mk
include ../../image/opencv/depend.mk
include ../../image/viam-genom/depend.mk
include ../../mk/robotpkg.mk
