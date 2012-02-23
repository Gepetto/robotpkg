# $LAAS: Makefile.common 2010/21/04 15:59:08 tmoulard $
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
#                                      Thomas Moulard on Wed Apr 21 2010
#

HPP_PACKAGE?=	undefined

MASTER_SITES?=	  ${MASTER_SITE_OPENROBOTS:=${HPP_PACKAGE}/}

DISTNAME?=	${HPP_PACKAGE}-${VERSION}
PKGNAME?=	${HPP_PACKAGE}-${VERSION}

MAINTAINER?=	hpp@laas.fr
#HOMEPAGE?=

ifeq (${HPP_PACKAGE},hpp)
else
  MASTER_REPOSITORY?=${MASTER_REPOSITORY_JRL}/${CATEGORIES}/${HPP_PACKAGE}.git
  USE_LANGUAGES+=c c++

  DOXYGEN_PLIST_DIR+=	share/doc/${HPP_PACKAGE}

  # Add dependency to boost.
  CMAKE_ARGS+=-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include
  CMAKE_ARGS+=-DBOOST_LIBRARYDIR=${PREFIX.boost-libs}/lib

  # options
  PKG_SUPPORTED_OPTIONS+=	verbose
  PKG_OPTION_DESCR.verbose=	Compile in verbose mode
  PKG_OPTION_SET.verbose:=	CPPFLAGS+=-DHPP_DEBUG

  PKG_SUPPORTED_OPTIONS+=	benchmark
  PKG_OPTION_DESCR.benchmark=	Measure computation times
  PKG_OPTION_SET.benchmark:=	CPPFLAGS+=-DHPP_ENABLE_BENCHMARK -DHPP_DEBUG

  include ../../mk/sysdep/cmake.mk
  include ../../mk/sysdep/doxygen.mk
  include ../../devel/boost-headers/depend.mk
  include ../../devel/boost-libs/depend.mk
  ifeq (${HPP_PACKAGE},hpp-util)
  else
    include ../../devel/hpp-util/depend.mk
  endif # ${HPP_PACKAGE} == hpp-util
  include ../../pkgtools/pkg-config/depend.mk
endif # ${HPP_PACKAGE} == meta-pkg
