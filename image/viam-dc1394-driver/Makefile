# robotpkg Makefile for:	image/viam-dc1394-driver
# Created:			Anthony Mallet on Wed, 2 Feb 2011
#

PKGNAME=		viam-dc1394-driver-${VERSION}
COMMENT=		Versatile Image Acquisition Module - dc1394 driver

include ../../image/viam-libs/Makefile.common

ONLY_FOR_PLATFORM+=	Linux-% Darwin-%-i386

CONFIGURE_ARGS+=	--disable-core
CONFIGURE_ARGS+=	--disable-v4l2
CONFIGURE_ARGS+=	--enable-dc1394

# options for opencv support
PKG_SUPPORTED_OPTIONS+= opencv
PKG_SUGGESTED_OPTIONS+= opencv

PKG_OPTION_DESCR.opencv=	Enable support for opencv.
define PKG_OPTION_UNSET.opencv
  CONFIGURE_ARGS+=--disable-opencv
  DEPEND_ABI.viam-libs+=	viam-libs~!opencv
endef
define PKG_OPTION_SET.opencv
  CONFIGURE_ARGS+=		--enable-opencv
  include ../../image/opencv/depend.mk
  DEPEND_ABI.opencv += opencv<3
  DEPEND_ABI.viam-libs+=	viam-libs~opencv
endef

include ../../image/libdc1394/depend.mk
include ../../image/viam-libs/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
