#
# Copyright (c) 2008,2010 LAAS/CNRS
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
#                                       Arnaud Degroote on Wed Apr 22 2008
#

OROCOS_VERSION=		1.10.3
DISTNAME=		orocos-rtt-${OROCOS_VERSION}-src
PKGNAME=		orocos-rtt-${OROCOS_VERSION}
CATEGORIES=		architecture
MASTER_SITES=	http://www.orocos.org/stable/rtt/v${OROCOS_VERSION}/	

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.orocos.org/rtt
COMMENT=		The Orocos Real-Time Toolkit

USE_LANGUAGES=	c c++
DOXYGEN_PLIST_DIR+=	share/doc/liborocos-rtt

CMAKE_ARGS+=	-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include

PKG_SUPPORTED_OPTIONS+=	corba

define PKG_OPTION_SET.corba
  CMAKE_ARGS+=		-DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB 

  include ../../devel/omniORB/depend.mk
endef

WRKSRC=			${WRKDIR}/orocos-rtt-${OROCOS_VERSION}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
