# robotpkg Makefile for:	devel/ycm
# Created:			Anthony Mallet on Thu, 10 Dec 2020
#

PKGREVISION=		1
VERSION=		0.12.0
PKGNAME=		ycm-${VERSION}
DISTNAME=		v${VERSION}
CATEGORIES=		devel
MASTER_SITES=		https://github.com/robotology/ycm/archive/
DIST_SUBDIR=		${PKGBASE}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://www.yarp.it/
COMMENT=		Extra CMake Modules for YARP and friends
LICENSE=		modified-bsd

CMAKE_ARGS+=		-DYCM_NO_3RDPARTY=YES

WRKSRC=			${WRKDIR}/ycm-${VERSION}

DEPEND_ABI.cmake=	cmake>=3.12

include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
