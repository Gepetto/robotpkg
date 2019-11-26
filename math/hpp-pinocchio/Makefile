# robotpkg Makefile for:	math/hpp-pinocchio
# Created:			Guilhem Saurel on Wed, 14 Mar 2018
#

HPP_PACKAGE=	hpp-pinocchio

CATEGORIES=	math
HPP_COMMENT=	Wrapping of the kinematic/dynamic chain Pinocchio for HPP.

include ../../meta-pkgs/hpp/Makefile.common

DEPEND_ABI.eigen3 += eigen3>=3.2.92
DEPEND_ABI.pinocchio += pinocchio>=2.1.6

# TODO: for tests
#include ../../wip/hpp-environments/depend.mk
#include ../../wip/ros-baxter-common/depend.mk
#include ../../robots/romeo-description/depend.mk

include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../path/hpp-util/depend.mk
include ../../graphics/assimp/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
