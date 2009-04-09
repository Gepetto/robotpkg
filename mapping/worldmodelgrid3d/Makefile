#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Wed Apr  8 2009
#

DISTNAME=	worldmodelgrid3d-1.0
CATEGORIES=	mapping
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=worldModelGrid3D/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	ftp://softs.laas.fr/pub/openrobots/worldModelGrid3D/
COMMENT=	Probabilistic, 3D occupancy grid building

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c++

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
