# robotpkg Makefile for:	interfaces/jrl-mal
# Created:			Anthony Mallet on Mon, 14 May 2007
#

DISTNAME=	jrl-mal-${VERSION}
PKGNAME=	jrl-mal-${VERSION}
VERSION=	1.19.3

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}/jrl-mal/
MASTER_REPOSITORY=	git git@github.com:jrl-umi3218/jrl-mal.git

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=
COMMENT=	Matrix abstraction layer for boost or vnl.
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=		c c++ fortran
DOXYGEN_PLIST_DIR+=	share/doc/jrl-mal

CMAKE_ARGS+= -DBLAS_blas_LIBRARY=${PREFIX.blas}/lib/libblas.so
CMAKE_ARGS+= -DLAPACK_lapack_LIBRARY=${PREFIX.lapack}/lib/liblapack.so

# options
PKG_SUPPORTED_OPTIONS+=	t3d jrl-mathtools
PKG_SUGGESTED_OPTIONS+=	jrl-mathtools

PKG_OPTION_DESCR.t3d=	Use t3d for rigid body transformations
define PKG_OPTION_SET.t3d
  CMAKE_ARGS+= -DSMALLMATRIX=t3d -DCXX_DISABLE_WERROR=TRUE
  include ../../math/t3d/depend.mk
endef

PKG_OPTION_DESCR.jrl-mathtools=	Use jrl-mathtools for rigid body transformations
define PKG_OPTION_SET.jrl-mathtools
  CMAKE_ARGS+= -DSMALLMATRIX=jrl-mathtools
endef

PKG_OPTIONS_REQUIRED_GROUPS=	matrix
PKG_OPTIONS_GROUP.matrix=	t3d jrl-mathtools

include ../../math/jrl-mathtools/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/boost-numeric-bindings-v1/depend.mk
include ../../math/lapack/depend.mk
include ../../math/blas/depend.mk

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/latex.mk

include ../../mk/robotpkg.mk
