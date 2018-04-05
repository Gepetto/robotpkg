# robotpkg Makefile for:	path/hpp-util
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=		hpp-fcl
HPP_VERSION=		0.4.2
PKGREVISION=		2
PKGNAME=		${HPP_PACKAGE}04-${HPP_VERSION}

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations
LICENSE=		2-clause-bsd

CONFLICTS+=		hpp-fcl-[0-9]*

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

USE_BOOST_LIBS= thread date_time system filesystem unit_test_framework

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
CMAKE_ARGS+=		-DFCL_HAVE_EIGEN=OFF

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/libccd/depend.mk
include ../../graphics/assimp/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
