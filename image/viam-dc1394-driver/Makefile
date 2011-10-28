# robotpkg Makefile for:	image/viam-dc1394-driver
# Created:			Anthony Mallet on Wed, 2 Feb 2011
#

PKGNAME=		viam-dc1394-driver-${VERSION}
COMMENT=		Versatile Image Acquisition Module - dc1394 driver

include ../../image/viam-libs/Makefile.common

CONFIGURE_ARGS+=	--disable-core
CONFIGURE_ARGS+=	--disable-v4l2
CONFIGURE_ARGS+=	--enable-dc1394

include ../../image/libdc1394/depend.mk
include ../../image/viam-libs/depend.mk
include ../../mk/robotpkg.mk
