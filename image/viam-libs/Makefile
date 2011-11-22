# robotpkg Makefile for:	image/viam-libs
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

include ../../image/viam-libs/Makefile.common
PKGREVISION=		1

BUILD_TARGET=		all
INSTALL_TARGET=		install

CONFIGURE_ARGS+=	--disable-dc1394
CONFIGURE_ARGS+=	--disable-v4l2

# options for opencv support
PKG_SUPPORTED_OPTIONS+= opencv
PKG_SUGGESTED_OPTIONS+= opencv

PKG_OPTION_DESCR.opencv=  Enable support for opencv.
PKG_OPTION_UNSET.opencv:= CONFIGURE_ARGS+=--disable-opencv
define PKG_OPTION_SET.opencv
  CONFIGURE_ARGS+=--enable-opencv
  include ../../image/opencv/depend.mk
endef

# options for doc generation
PKG_SUPPORTED_OPTIONS+= doc
PKG_SUGGESTED_OPTIONS+= doc

PKG_OPTION_DESCR.doc=	Install documentation files.
define PKG_OPTION_SET.doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/viam-libs
  include ../../mk/sysdep/doxygen.mk
endef

include ../../mk/robotpkg.mk
