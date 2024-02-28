# robotpkg Makefile for:	optimization/roboptim-trajectory
# Created:			florent on Sat, 9 May 2009
#

PKGREVISION=	1
VERSION=	3.1
PACKAGE=	roboptim-trajectory
DISTNAME=	${PACKAGE}-${VERSION}
MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=roboptim/${PACKAGE}/releases/download/v${VERSION}/}
MASTER_REPOSITORY=git git://github.com/roboptim/${PACKAGE}.git

CATEGORIES=	optimization
COMMENT=	Optimization for robotics: trajectory optimization
HOMEPAGE=	http://www.roboptim.net
LICENSE=	gnu-lgpl-v3
MAINTAINER=	roboptim@googlegroups.com

DYNAMIC_PLIST_DIRS+=	share/doc/roboptim-trajectory

# disable -Werror, otherwise this does not build
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

# cmake cannot find those alone:
INCLUDE_DIRS.libtool-ltdl=	include
LIBRARY_DIRS.libtool-ltdl=	lib
RPATHS_DIRS.libtool-ltdl=	lib

USE_BOOST_LIBS=		filesystem system thread program_options serialization
USE_BOOST_LIBS+=	unit_test_framework

DEPEND_ABI.eigen3+=	eigen3>=3.2.0

include ../../math/eigen3/depend.mk
include ../../optimization/roboptim-core/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/sysdep/libtool-ltdl.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
