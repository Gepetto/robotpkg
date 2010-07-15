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
#                                       Anthony Mallet on Wed Sep 17 2008
#

DISTNAME=	hpp-walkfootplanner-${VERSION}
VERSION=	2.0
PKGREVISION=	1

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-walkfootplanner/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hppWalkFootPlanner

MAINTAINER=	hpp@laas.fr
COMMENT=	Collision free walk path planning for a humanoid robot.

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes

DOXYGEN_PLIST_DIR+=	share/doc/hpp-walkfootplanner

# options
PKG_SUPPORTED_OPTIONS+=	verbose
PKG_OPTION_DESCR.verbose=	Compile in verbose mode
PKG_OPTION_SET.verbose:=	CPPFLAGS+=-DHPP_DEBUG

PKG_SUPPORTED_OPTIONS+=	benchmark
PKG_OPTION_DESCR.benchmark=	Measure computation times
PKG_OPTION_SET.benchmark:=	CPPFLAGS+=-DHPP_ENABLE_BENCHMARK -DHPP_DEBUG

include ../../mk/sysdep/doxygen.mk
include ../../math/jrl-mathtools/depend.mk
include ../../path/hpp-core/depend.mk
include ../../optimization/roboptim-trajectory/depend.mk
include ../../optimization/roboptim-core-cfsqp-plugin/depend.mk
DEPEND_ABI.boost-headers?=	boost-headers>=1.35
include ../../devel/boost-headers/depend.mk
DEPEND_ABI.boost-libs?=		boost-libs>=1.35
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
