# robotpkg Makefile for:	path/hpp-fcl
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-fcl
HPP_VERSION=		1.7.4

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations
LICENSE=		2-clause-bsd

CONFLICTS+=		hpp-fcl04-[0-9]*

include ../../meta-pkgs/hpp/Makefile.common

USE_BOOST_LIBS= thread date_time system filesystem unit_test_framework chrono

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

include ../../mk/robotpkg.prefs.mk
ifeq (,$(filter Ubuntu-16.04 Debian-9,${OPSYS}-${OS_VERSION}))
  CMAKE_ARGS+=		-DHPP_FCL_HAS_QHULL=ON
  include ../../mk/sysdep/qhull.mk
endif

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/libccd/depend.mk
include ../../graphics/assimp/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
