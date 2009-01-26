# $LAAS: Makefile 2009/01/08 16:00:26 mallet $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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
#                                       Anthony Mallet on Mon May 14 2008
#

DISTNAME=	matrixabstractlayer-${VERSION}
PKGNAME=	jrl-mal-${VERSION}
VERSION=	1.7.1

CATEGORIES=	interfaces
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Matrix abstraction layer for boost or vnl.

USE_CMAKE=	yes
DOXYGEN_PLIST_DIR+=	share/doc/MatrixAbstractLayer

# options
PKG_SUPPORTED_OPTIONS+=	t3d jrl-mathtools
PKG_SUGGESTED_OPTIONS+=	t3d

PKG_OPTION_DESCR.t3d=	Use t3d for rigid body transformations
define PKG_OPTION_SET.t3d
  CMAKE_ARGS+= -DSMALLMATRIX=t3d 
  include ../../math/t3d/depend.mk
endef

PKG_OPTION_DESCR.jrl-mathtools=	Use jrl-mathtools for rigid body transformations
define PKG_OPTION_SET.jrl-mathtools
  CMAKE_ARGS+= -DSMALLMATRIX=jrlMathTools 
  include ../../math/jrl-mathtools/depend.mk
endef

include ../../mk/sysdep/cmake.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
