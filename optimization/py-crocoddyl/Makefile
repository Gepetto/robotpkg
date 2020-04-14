# robotpkg Makefile for:	optimization/py27-crocoddyl
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

PKGREVISION=		1
ORG=			loco-3d
NAME=			crocoddyl
VERSION=		1.2.0

CATEGORIES=		optimization
COMMENT=		Optimal control library for robot under contact sequence
LICENSE=		2-clause-bsd
MAINTAINER=		gepetto-soft@laas.fr

CONFLICTS+=		py[0-9][0-9]-crocoddyl

USE_PYTHON=		true

# parallel builds exhaust memory - until a better solution is found
MAKE_JOBS_SAFE=		no

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/assimp/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../math/py-pinocchio/depend.mk
include ../../math/py-quadprog/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../robots/example-robot-data/depend.mk
include ../../robots/py-example-robot-data/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/py-scipy.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk

include ../../mk/robotpkg.mk
