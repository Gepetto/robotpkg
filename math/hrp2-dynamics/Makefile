# robotpkg Makefile for:	math/hrp2-dynamics
# Created:			Anthony Mallet on Mon, 18 Feb 2008
#

DISTNAME=	hrp2-dynamics-${VERSION}
PKGNAME=	hrp2-dynamics-${VERSION}
VERSION=	1.5.3

CATEGORIES=	math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hrp2-dynamics/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hrp2-dynamics

MAINTAINER=	hpp@laas.fr
COMMENT=	Optimized implementation of functions related to HRP-2 dynamics.
LICENSE=	cnrs-hpp-closed-source

RESTRICTED=	Redistribution of sources and repackaged binaries not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

CMAKE_ARGS+=-DCMAKE_INSTALL_LIBDIR=lib
DYNAMIC_PLIST_DIRS+=	share/doc/hrp2-dynamics

PKG_SUPPORTED_OPTIONS+= debug
PKG_OPTION_DESCR.debug=	Compile in debugging mode
PKG_OPTION_SET.debug:=	CMAKE_ARGS+= -DCMAKE_BUILD_TYPE=Debug

include ../../mk/sysdep/cmake.mk
include ../../math/jrl-dynamics/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
