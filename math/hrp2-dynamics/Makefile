# robotpkg Makefile for:	math/hrp2-dynamics
# Created:			Anthony Mallet on Mon, 18 Feb 2008
#

DISTNAME=	hrp2-dynamics-${VERSION}
PKGNAME=	hrp2-dynamics-${VERSION}
VERSION=	1.5.2

CATEGORIES=	math
NO_PUBLIC_SRC=	yes
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hrp2-dynamics/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hrp2Dynamics

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Optimized implementation of functions related to HRP-2 dynamics.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/hrp2-dynamics

PKG_SUPPORTED_OPTIONS+= debug
PKG_OPTION_DESCR.debug=	Compile in debugging mode
PKG_OPTION_SET.debug:=	CMAKE_ARGS+= -DCMAKE_BUILD_TYPE=Debug

include ../../mk/sysdep/cmake.mk
include ../../math/jrl-dynamics/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
