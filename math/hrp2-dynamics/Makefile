# $LAAS: Makefile 2009/02/10 17:13:47 tho $
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
#                                       Anthony Mallet on Mon Feb 18 2008
#

DISTNAME=	hrp2dynamics-${VERSION}
PKGNAME=	hrp2-dynamics-${VERSION}
VERSION=	1.5.1

CATEGORIES=	math
NO_PUBLIC_SRC=	yes
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hrp2Dynamics

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Optimized implementation of functions related to HRP-2 dynamics.

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/hrp2Dynamics

PKG_SUPPORTED_OPTIONS+= debug
PKG_OPTION_DESCR.debug=	Compile in debugging mode
PKG_OPTION_SET.debug:=	CMAKE_ARGS+= -DCMAKE_BUILD_TYPE=Debug

include ../../mk/sysdep/cmake.mk
include ../../math/jrl-dynamics/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
