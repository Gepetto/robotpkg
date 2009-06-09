# $LAAS: Makefile 2009/03/16 22:43:58 tho $
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
VERSION=	1.7.4

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}/jrl-mal/
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}/MatrixAbstractLayer

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=
COMMENT=	Matrix abstraction layer for boost or vnl.

USE_LANGUAGES+=		c++ fortran
DOXYGEN_PLIST_DIR+=	share/doc/MatrixAbstractLayer

CMAKE_ARGS+= -DBLAS_blas_LIBRARY=${PREFIX.blas}/lib/libblas.so
CMAKE_ARGS+= -DLAPACK_lapack_LIBRARY=${PREFIX.lapack}/lib/liblapack.so

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
endef

PKG_OPTIONS_REQUIRED_GROUPS=	matrix
PKG_OPTIONS_GROUP.matrix=	t3d jrl-mathtools

include ../../math/jrl-mathtools/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/boost-numeric-bindings/depend.mk
include ../../math/lapack/depend.mk
include ../../math/blas/depend.mk

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/latex.mk

include ../../mk/robotpkg.mk
