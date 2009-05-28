# $LAAS: Makefile 2009/03/30 10:58:01 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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

DISTNAME=	hppwalkfootplanner-${VERSION}
PKGNAME=	hpp-walkfootplanner-${VERSION}
VERSION=	1.2.2

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-walkfootplanner/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hppWalkFootPlanner

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Collision free walk path planning for a humanoid robot.

GNU_CONFIGURE=	yes

DOXYGEN_PLIST_DIR+=	share/doc/hppWalkPlanner

# options
PKG_OPTIONS_OPTIONAL_GROUPS+=	verbose
PKG_OPTIONS_GROUP.verbose=	verbose1 verbose2

PKG_OPTION_DESCR.verbose1=	Set the level of verbosity to 1
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

PKG_OPTION_DESCR.verbose2=	Set the level of verbosity to 2
PKG_OPTION_SET.verbose2:=	CXXFLAGS+=-DDEBUG=2

include ../../mk/sysdep/doxygen.mk
include ../../math/jrl-mathtools/depend.mk
include ../../path/hpp-core/depend.mk
include ../../devel/hpp-kwsplus/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
