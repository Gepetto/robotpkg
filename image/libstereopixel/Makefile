# $Id: Makefile 2007/11/27 11:43:03 mallet $

DISTNAME=		libstereopixel-1.2
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Stereo-vision by pixel correlation

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

# options
PKG_SUPPORTED_OPTIONS+=	calife

PKG_OPTION_DESCR.calife=	Enable calife compatibility (Don't set it if you don't know what it means)
PKG_OPTION_SET.calife:=	CONFIGURE_ARGS+=--enable-calife
# XXX wrong
PKG_OPTIONS_UNSET.calife:=

include ../../image/libimages3d/depend.mk
include ../../mk/robotpkg.mk
