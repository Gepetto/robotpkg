# robotpkg Makefile for:	localization/hueblob-genom
# Created:			Anthony Mallet on Mon, 17 Mar 2008
#

DISTNAME=		hueblob-genom-1.3
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hueblob-genom/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}hueblob-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for simple object detection and localization
LICENSE=		2-clause-bsd

USE_LANGUAGES=		c c++
GENOM_MODULE=		hueblob

# option for image display using opencv
PKG_SUPPORTED_OPTIONS+=	display
PKG_SUGGESTED_OPTIONS+=	display

PKG_OPTION_DESCR.display=	Enable embedded image display facility.
define PKG_OPTION_SET.display
  DEPEND_ABI.opencv+=	opencv~gtk
  CONFIGURE_ARGS+=	--with-display
endef
PKG_OPTION_UNSET.display:=	CONFIGURE_ARGS+=--without-display

PKG_OPTIONS_OPTIONAL_GROUPS+=	incompatible
PKG_OPTIONS_GROUP.incompatible=	api display

define PKG_OPTION_UNSET.api
  include ../../image/libimages3d/depend.mk
  include ../../image/opencv/depend.mk
endef

include ../../image/viam-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
