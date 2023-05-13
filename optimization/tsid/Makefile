# robotpkg Makefile for:	optimization/tsid
# Created:			Justin Carpentier on Tue, 14 Apr 2020
#

ORG=			stack-of-tasks
NAME=			tsid
VERSION=		1.7.0

CATEGORIES=		optimization
COMMENT=		Efficient Inverse Dynamics based on Pinocchio

CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

USE_BOOST_LIBS=		unit_test_framework

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/eiquadprog/depend.mk
include ../../math/pinocchio/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
