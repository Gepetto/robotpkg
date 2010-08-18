# $LAAS: Makefile 2008/12/09 19:22:12 mallet $
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
#                                       Anthony Mallet on Fri Jul 13 2007
#

DISTNAME=	hppCore-${VERSION}
PKGNAME=	hpp-core-${VERSION}
VERSION=	1.12

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-core/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hppCore

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with KineoWorks(tm).

USE_LANGUAGES+=	c c++

DOXYGEN_PLIST_DIR+=	share/doc/hppCore

# --- options --------------------------------------------------------

# ChppBody class
PKG_SUPPORTED_OPTIONS+=	with-body

PKG_OPTION_DESCR.with-body=	Use internal definition of ChppBody class.
PKG_OPTION_SET.with-body:=	CONFIGURE_ARGS+=	-DENABLE_BODY=YES
define PKG_OPTION_UNSET.with-body
  CONFIGURE_ARGS+=	-DENABLE_BODY=NO
  include ../../devel/hpp-model/depend.mk
endef

# verbosity
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

# --------------------------------------------------------------------

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../devel/hpp-kwsplus/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
