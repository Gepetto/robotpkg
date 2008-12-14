# $LAAS: Makefile 2008/12/13 16:52:08 tho $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                       Anthony Mallet on Fri Mar 14 2008
#

DISTNAME=		viam-libs-1.3
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=viam-libs/}
PKGREVISION=		1

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.laas.fr/~mallet
COMMENT=		Versatile Image Acquisition Module - Libraries

GNU_CONFIGURE=		yes

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
  DOXYGEN_PLIST_DIR+=	share/doc/viam-libs
  include ../../mk/sysdep/doxygen.mk
endef
PKG_OPTION_UNSET.doc:=  MAKE_ENV+= NO_INSTALL_DOC=\\\#

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
