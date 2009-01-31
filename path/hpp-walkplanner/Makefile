# $LAAS: Makefile 2008/12/09 20:10:10 mallet $
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

DISTNAME=	hppwalkplanner-${VERSION}
PKGNAME=	hpp-walkplanner-${VERSION}
VERSION=	1.6

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-walkplanner/}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Path planning algorithm for a walking humanoid robot.

GNU_CONFIGURE=	yes

# options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../robots/hrp2-14/depend.mk
include ../../path/jrl-walkgen/depend.mk
include ../../path/hpp-walkfootplanner/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-openhrp/depend.mk
include ../../devel/hpp-kwsplus/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
