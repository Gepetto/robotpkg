# robotpkg Makefile for:	devel/py-ament-package
# Created:			Anthony Mallet on Wed, 23 Mar 2022
#

DISTNAME=	spdlog-1.10.0
MASTER_SITES=	${MASTER_SITE_GITHUB:=gabime/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

COMMENT=	Fast C++ logging library.
CATEGORIES=	devel
LICENSE=	mit

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib
CMAKE_ARGS+=	-DSPDLOG_BUILD_EXAMPLE=OFF

DEPEND_METHOD.python?=	build

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
