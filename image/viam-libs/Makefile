# robotpkg Makefile for:	image/viam-libs
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DISTNAME=		viam-libs-1.7
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=viam-libs/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/viam-libs

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.laas.fr/~mallet
COMMENT=		Versatile Image Acquisition Module - Libraries
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes
BUILD_TARGET=		all
INSTALL_TARGET=		install

# options for dc1394 support
PKG_SUPPORTED_OPTIONS+= dc1394
PKG_SUGGESTED_OPTIONS+= dc1394

PKG_OPTION_DESCR.dc1394=  Enable support for dc1394
PKG_OPTION_UNSET.dc1394:= CONFIGURE_ARGS+=--disable-dc1394
define PKG_OPTION_SET.dc1394
  CONFIGURE_ARGS+=--enable-dc1394
  include ../../image/libdc1394/depend.mk
endef

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

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
