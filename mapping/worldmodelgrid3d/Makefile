# robotpkg Makefile for:	mapping/worldmodelgrid3d
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DISTNAME=	worldmodelgrid3d-1.0
CATEGORIES=	mapping
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=worldModelGrid3D/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	ftp://softs.laas.fr/pub/openrobots/worldModelGrid3D/
COMMENT=	Probabilistic, 3D occupancy grid building

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++

DOXYGEN_PLIST_DIR+=	share/doc/worldModelGrid3D


# 3D image options
PKG_SUPPORTED_OPTIONS+=	boost
PKG_SUGGESTED_OPTIONS+=	boost

PKG_OPTION_DESCR.boost=Use boost 3D image structure
define PKG_OPTION_SET.boost
  CONFIGURE_ARGS+=--with-images=boost
  include ../../devel/boost-headers/depend.mk
endef

define PKG_OPTION_UNSET.boost
  CONFIGURE_ARGS+=--with-images=libimages3d
  include ../../image/libimages3d/depend.mk
endef

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
