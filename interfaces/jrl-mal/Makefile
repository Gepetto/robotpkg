# robotpkg Makefile for:	interfaces/jrl-mal
# Created:			Anthony Mallet on Mon, 14 May 2007
#

PKGREVISION=	1
DISTNAME=	jrl-mal-${VERSION}
VERSION=	1.19.6
CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-mal/}
MASTER_REPOSITORY=	git git@github.com:jrl-umi3218/jrl-mal.git

MAINTAINER=	openrobots@laas.fr
COMMENT=	Matrix abstraction layer for boost or vnl.
LICENSE=	gnu-lgpl-v3

DYNAMIC_PLIST_DIRS+=	share/doc/jrl-mal

CMAKE_ARGS+=	-DCXX_DISABLE_WERROR=TRUE
CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib

# configure the path to blas/lapack libraries. cmake Find{BLAS,LAPACK}
# have no other mean to configure a specific path.
CMAKE_ARGS+=\
  '-DBLAS_LIBRARIES=${BLAS_LIB}'			\
  '-DLAPACK_LIBRARIES=${LAPACK_LIB};${BLAS_LIB}'

# for doxygen
INSTALL_MAKE_FLAGS+=	PATH=${PATH}:${PREFIX.latex}/bin

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
include ../../math/boost-numeric-bindings-v1/depend.mk
include ../../math/lapack/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/latex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
