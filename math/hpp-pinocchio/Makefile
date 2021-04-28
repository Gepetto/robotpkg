# robotpkg Makefile for:	math/hpp-pinocchio
# Created:			Guilhem Saurel on Wed, 14 Mar 2018
#

HPP_PACKAGE=		hpp-pinocchio
HPP_COMMENT=		Wrapping of the kinematic/dynamic chain Pinocchio for HPP.

CATEGORIES=		math

include ../../meta-pkgs/hpp/Makefile.common

include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../path/hpp-util/depend.mk
include ../../graphics/assimp/depend.mk
include ../../simulation/hpp-environments/depend.mk
include ../../robots/example-robot-data/depend.mk
include ../../robots/py-hpp-baxter/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

# g++ 5.4.0 segfaults
DEPEND_ABI.g++ +=	g++>=5.5

include ../../mk/robotpkg.mk
