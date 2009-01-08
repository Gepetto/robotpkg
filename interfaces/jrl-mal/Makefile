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
VERSION=	1.4

CATEGORIES=	interfaces
MASTER_SITES=	${MASTER_SITE_JRL}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Matrix abstraction layer for boost or vnl.

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/MatrixAbstractLayer

# options
PKG_SUPPORTED_OPTIONS+=	boost vnl t3d
PKG_SUGGESTED_OPTIONS+=	boost t3d

PKG_OPTION_DESCR.boost=	Use boost for generic NxP matrix implementation
define PKG_OPTION_SET.boost
  CONFIGURE_ARGS+=	--with-boost=${PREFIX.boost-numeric-bindings}

  include ../../devel/boost-numeric-bindings/depend.mk
  include ../../math/lapack/depend.mk
endef

PKG_OPTION_DESCR.vnl=	Use vnl for generic NxP matrix implementation
PKG_OPTION_SET.vnl:=	CONFIGURE_ARGS+=	--with-vnl=${PREFIX}

PKG_OPTION_DESCR.t3d=	Use t3d for rigid body transformations
define PKG_OPTION_SET.t3d
  CONFIGURE_ARGS+=	--with-t3d
  include ../../math/t3d/depend.mk
endef

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
