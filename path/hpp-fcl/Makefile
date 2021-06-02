# robotpkg Makefile for:	path/hpp-fcl
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-fcl
HPP_VERSION=		1.7.3

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations
LICENSE=		2-clause-bsd

CONFLICTS+=		hpp-fcl04-[0-9]*

include ../../meta-pkgs/hpp/Makefile.common

USE_BOOST_LIBS= thread date_time system filesystem unit_test_framework chrono

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/libccd/depend.mk
include ../../graphics/assimp/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
