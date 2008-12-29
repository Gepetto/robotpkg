# $LAAS: Makefile 2008/12/29 19:10:06 tho $
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
#                                       Anthony Mallet on Wed Aug 29 2007
#

DISTNAME=	kppinterfacewalk-${VERSION}
PKGNAME=	kpp-interfacewalk-${VERSION}
VERSION=	1.6

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=kpp-interfacewalk/}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for hppWalkPlanner libraries.

DEPENDS+=	kpp-interface>=1.2:../../graphics/kpp-interface

GNU_CONFIGURE=	yes
DOXYGEN_PLIST_DIR+=share/doc/kppInterfaceWalk

# options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../mk/sysdep/doxygen.mk
include ../../path/hpp-openhrp/depend.mk
include ../../path/hpp-walkplanner/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
