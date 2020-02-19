# robotpkg Makefile for:	math/pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

ORG=			stack-of-tasks
NAME=			pinocchio
VERSION=		2.3.1

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics
HOMEPAGE=		http://${ORG}.github.io/${NAME}/

CMAKE_ARGS+=		-DBUILD_BENCHMARK=OFF
CMAKE_ARGS+=		-DBUILD_TESTING=OFF
CMAKE_ARGS+=		-DBUILD_UTILS=OFF
CMAKE_ARGS+=		-DBUILD_TESTS_WITH_HPP=OFF
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF
CMAKE_ARGS+=		-DBUILD_WITH_COLLISION_SUPPORT=ON

USE_BOOST_LIBS=		system filesystem
USE_MASTER_GITHUB=	true

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../math/eigen3/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../mapping/octomap/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk

DEPEND_ABI.urdfdom +=	urdfdom>=0.2.3

include ../../mk/robotpkg.mk
