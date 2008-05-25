# $LAAS: Makefile 2008/05/25 13:14:15 tho $
#
# Copyright (c) 2007-2008 LAAS/CNRS
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

DISTNAME=	hppcorbaserver-${VERSION}
PKGNAME=	hpp-corbaserver-${VERSION}
VERSION=	1.3

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Corba interface with hppCore package.

DEPENDS+=	hpp-core>=1.3:../../path/hpp-core

GNU_CONFIGURE=	yes

# --- options --------------------------------------------------------

# OpenHRP(tm) support
PKG_SUPPORTED_OPTIONS+=	openhrp
PKG_SUGGESTED_OPTIONS+=	openhrp

PKG_OPTION_DESCR.openhrp=	Build an OpenHRP(tm) client.
define PKG_OPTION_SET.openhrp
  CONFIGURE_ARGS+=	--with-openhrp
  DEPENDS+=		hpp-openhrp>=1.1:../../path/hpp-openhrp
  DEPENDS+=		jrl-modelloader>=1.2:../../devel/jrl-modelloader
  DEPENDS+=		hrp2-dynamics>=1.0:../../math/hrp2-dynamics
  include ../../robots/hrp2-14/depend.mk
endef

# Verbosity
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

# --------------------------------------------------------------------

include ../../devel/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
