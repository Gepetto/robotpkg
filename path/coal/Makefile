# robotpkg Makefile for:	path/coal
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

ORG=			coal-library
NAME=			coal
VERSION=		3.0.0

CATEGORIES=		path
COMMENT=		collision detection and distance computations
LICENSE=		2-clause-bsd
CONFLICTS+=		hpp-fcl-[0-9]*

USE_BOOST_LIBS= thread date_time system filesystem unit_test_framework chrono
USE_MASTER_GITHUB=	true

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF
CMAKE_ARGS+=		-DCOAL_BACKWARD_COMPATIBILITY_WITH_HPP_FCL=ON

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../mk/robotpkg.prefs.mk
ifeq (,$(filter Ubuntu-16.04 Debian-9,${OPSYS}-${OS_VERSION}))
  CMAKE_ARGS+=		-DHPP_FCL_HAS_QHULL=ON
  include ../../mk/sysdep/qhull.mk
endif

DEPEND_ABI.assimp+=	assimp>=5

include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
