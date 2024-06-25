# robotpkg Makefile for:	devel/ycm
# Created:			Anthony Mallet on Thu, 10 Dec 2020
#

DISTNAME=		ycm-cmake-modules-0.16.4
MASTER_SITES=		${MASTER_SITE_GITHUB:=robotology/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

CATEGORIES=		devel
MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://www.yarp.it/
COMMENT=		Extra CMake Modules for YARP and friends
LICENSE=		modified-bsd

# this was renamed
CONFLICTS+=		ycm-[0-9]*

CMAKE_ARGS+=		-DYCM_NO_3RDPARTY=YES

DEPEND_ABI.cmake=	cmake>=3.16

include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
