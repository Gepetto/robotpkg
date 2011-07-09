# robotpkg Makefile for:	math/hrp2-10-optimized
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DISTNAME=	hrp2-10-optimized-${VERSION}
PKGNAME=	hrp2-10-optimized-${VERSION}
VERSION=	1.0.2

CATEGORIES=	math
NO_PUBLIC_SRC=	yes
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}robots/hrp2-10-optimized

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Optimized implementation of HRP2-10 dynamics.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/hrp2-10-optimized

PKG_SUPPORTED_OPTIONS+= debug
PKG_OPTION_DESCR.debug=	Compile in debugging mode
PKG_OPTION_SET.debug:=	CMAKE_ARGS+= -DCMAKE_BUILD_TYPE=Debug

include ../../mk/sysdep/cmake.mk
include ../../robots/hrp2-10/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
