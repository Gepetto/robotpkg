# robotpkg Makefile for:	image/viam-v4l-driver
# Created:			Anthony Mallet on Wed, 2 Feb 2011
#

PKGNAME=		viam-v4l-driver-${VERSION}
COMMENT=		Versatile Image Acquisition Module - v4l driver

include ../../image/viam-libs/Makefile.common

CONFIGURE_ARGS+=	--disable-core
CONFIGURE_ARGS+=	--disable-dc1394
CONFIGURE_ARGS+=	--enable-v4l2

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
  DEPEND_ABI.opencv+=		opencv<3
  DEPEND_ABI.viam-libs+=	viam-libs~opencv
endef

include ../../image/viam-libs/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
