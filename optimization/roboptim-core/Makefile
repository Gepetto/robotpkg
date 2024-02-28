# robotpkg Makefile for:	optimization/roboptim-core
# Created:			florent@laas.fr on Tue, 28 Apr 2009
#

PKGREVISION=	2
VERSION=	3.1
PACKAGE=	roboptim-core
DISTNAME=	${PACKAGE}-${VERSION}
MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=roboptim/${PACKAGE}/releases/download/v${VERSION}/}
MASTER_REPOSITORY=git git://github.com/roboptim/${PACKAGE}.git

CATEGORIES=	optimization
COMMENT=	Optimization for robotics: common API to various solvers
HOMEPAGE=	http://www.roboptim.net
LICENSE=	gnu-lgpl-v3
MAINTAINER=	roboptim@googlegroups.com

CMAKE_ARGS+=		-DBOOST_ROOT=${PREFIX.boost-headers}
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
DYNAMIC_PLIST_DIRS+=	share/doc/roboptim-core

INCLUDE_DIRS.libtool-ltdl=	include
LIBRARY_DIRS.libtool-ltdl=	lib
RPATH_DIRS.libtool-ltdl=	lib

DEPEND_ABI.eigen3+=	eigen3>=3.2.0
DEPEND_ABI.g++ +=	g++>=4.6

include ../../devel/log4cxx/depend.mk
include ../../math/eigen3/depend.mk
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
