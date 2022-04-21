# robotpkg Makefile for:	devel/foonathan-memory
# Created:			Anthony Mallet on Fri,  8 Apr 2022
#

VERSION=	0.7-1
DISTNAME=	memory-${subst -,.,${VERSION}}
PKGNAME=	foonathan-${DISTNAME}
MASTER_SITES=	${MASTER_SITE_GITHUB:=foonathan/}
GITHUB_TAG=	v${VERSION}

COMMENT=	STL compatible C++ memory allocator
CATEGORIES=	devel
MAINTAINER=	mallet@laas.fr
LICENSE=	modified-bsd

ROS2_AMENTPKG=	no
include ../../meta-pkgs/ros2-core/Makefile.common

WRKSRC=		${WRKDIR}/memory-${VERSION}

CMAKE_ARGS+=	-DFOONATHAN_MEMORY_BUILD_EXAMPLES=OFF
CMAKE_ARGS+=	-DFOONATHAN_MEMORY_BUILD_TESTS=OFF
CMAKE_ARGS+=	-DFOONATHAN_MEMORY_BUILD_TOOLS=OFF

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib

DEPEND_ABI.cmake= cmake>=3.11

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
