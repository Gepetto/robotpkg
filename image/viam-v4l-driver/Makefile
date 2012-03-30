# robotpkg Makefile for:	image/viam-v4l-driver
# Created:			Anthony Mallet on Wed, 2 Feb 2011
#

PKGNAME=		viam-v4l-driver-${VERSION}
PKGREVISION=		1
COMMENT=		Versatile Image Acquisition Module - v4l driver

include ../../image/viam-libs/Makefile.common

CONFIGURE_ARGS+=	--disable-core
CONFIGURE_ARGS+=	--disable-dc1394
CONFIGURE_ARGS+=	--enable-v4l2

include ../../image/viam-libs/depend.mk
include ../../mk/robotpkg.mk
