#
# Copyright (c) 2008-2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Mon Mar 17 2008
#

DISTNAME=		hueblob-genom-1.2
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hueblob-genom/}

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
  REQD_BUILD_OPTIONS.opencv+=	gtk
  CONFIGURE_ARGS+=		--with-display
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
