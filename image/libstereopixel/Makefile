# robotpkg Makefile for:	image/libstereopixel
# Created:			Anthony Mallet on Wed, 5 Dec 2007
#

DISTNAME=		libstereopixel-1.3
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/libstereopixel

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Stereo-vision by pixel correlation
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

# options
PKG_SUPPORTED_OPTIONS+=	calife sse

PKG_OPTION_DESCR.calife=	Enable calife compatibility (Don't set it if you don't know what it means)
PKG_OPTION_SET.calife:=		CONFIGURE_ARGS+=--enable-calife
PKG_OPTIONS_UNSET.calife:=	CONFIGURE_ARGS+=--disable-calife

PKG_OPTION_DESCR.sse=	 	Enable sse optimization
PKG_OPTION_SET.sse=		CFLAGS+=-msse2 -mfpmath=sse -flax-vector-conversions



include ../../image/libimages3d/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
