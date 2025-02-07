# robotpkg Makefile for:	path/fcl
# Created:			Guilhem Saurel on Dec 20 2018
#

DISTNAME=		fcl-0.7.0
MASTER_SITES=		${MASTER_SITE_GITHUB:=flexible-collision-library/}

CATEGORIES=		path
COMMENT=		The Flexible Collision Library
LICENSE=		modified-bsd
MAINTAINER=		gsaurel@laas.fr

DEPEND_ABI.cmake +=	cmake>=2.8.12

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

include ../../mapping/octomap/depend.mk
include ../../math/libccd/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
