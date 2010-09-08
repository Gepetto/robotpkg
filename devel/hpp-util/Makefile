# $LAAS: depend.mk 2010/08/09 17:12:58 tmoulard $
#
# Copyright (c) 2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Thomas Moulard on Wed Sep 08 2010
#

PACKAGE_NAME=		hpp-util
VERSION=		0.3
DISTNAME=		${PACKAGE_NAME}-${VERSION}
PKGNAME=		${PACKAGE_NAME}-${VERSION}

CATEGORIES=		devel
COMMENT=		Technical tools shared amongst HPP.
MAINTAINER=		hpp@laas.fr
LICENSE=		gnu-gpl-v3

MASTER_REPOSITORY=	git git://github.com/laas/hpp-util.git
MASTER_SITES=		http://github.com/downloads/laas/${PACKAGE_NAME}/


USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hpp-util

PKG_SUPPORTED_OPTIONS+=		verbose
PKG_OPTION_DESCR.verbose=	Compile in verbose mode
PKG_OPTION_SET.verbose=		CXXFLAGS+=-DHPP_DEBUG

PKG_SUPPORTED_OPTIONS+=		benchmark
PKG_OPTION_DESCR.benchmark=	Measure computation times
PKG_OPTION_SET.benchmark=	CXXFLAGS+=-DHPP_ENABLE_BENCHMARK

PKG_SUGGESTED_OPTIONS+=		verbose benchmark

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
