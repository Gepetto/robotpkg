# $LAAS: Makefile 2009/04/09 19:08:22 mallet $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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
#                                       Anthony Mallet on Mon Aug 27 2007
#

DISTNAME=	hppCorbaServer-${VERSION}
PKGNAME=	hpp-corbaserver-${VERSION}
VERSION=	1.8.0

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-corbaserver/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hppCorbaServer

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Corba interface with hppCore package.

USE_LANGUAGES+=	c c++

GNU_CONFIGURE=	yes
DOXYGEN_PLIST_DIR+= share/doc/hppCorbaServer


# --- options --------------------------------------------------------

# OpenHRP(tm) support
PKG_SUPPORTED_OPTIONS+=	openhrp
PKG_SUGGESTED_OPTIONS+=	openhrp

PKG_OPTION_DESCR.openhrp=	Build an OpenHRP(tm) client.
define PKG_OPTION_SET.openhrp
  CONFIGURE_ARGS+=	--with-openhrp
  include ../../math/hrp2-dynamics/depend.mk
  include ../../path/hpp-openhrp/depend.mk
  include ../../devel/jrl-modelloader/depend.mk
  include ../../robots/hrp2-14/depend.mk
endef

# Verbosity
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

# --------------------------------------------------------------------

include ../../robots/hrp2-builder/depend.mk
include ../../path/hpp-core/depend.mk
include ../../devel/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
