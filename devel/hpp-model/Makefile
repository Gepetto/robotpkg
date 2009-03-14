# $LAAS: Makefile 2008/10/13 11:19:26 mallet $
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
#                                       Anthony Mallet on Mon Feb 18 2008
#

DISTNAME=	hppmodel-${VERSION}
PKGNAME=	hpp-model-${VERSION}
VERSION=	1.5

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-model/}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Robots, humanoid robots, joints and bodies with dynamics properties

GNU_CONFIGURE=	yes

# options
PKG_SUPPORTED_OPTIONS+=	jrl-dynamics
PKG_SUGGESTED_OPTIONS+=	jrl-dynamics

PKG_OPTION_DESCR.jrl-dynamics=Use jrl-dynamics package for dynamic model implementation.
define PKG_OPTION_SET.jrl-dynamics
  CONFIGURE_ARGS+=	--with-robotDynamics=dynamicsJRLJapan
  include ../../math/jrl-dynamics/depend.mk
endef

#Options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../path/kineo-pp/depend.mk
include ../../devel/hpp-kwsio/depend.mk
include ../../interfaces/jrl-interface-dynamics/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
