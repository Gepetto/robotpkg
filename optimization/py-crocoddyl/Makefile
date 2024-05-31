# robotpkg Makefile for:	optimization/py27-crocoddyl
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

ORG=			loco-3d
NAME=			crocoddyl
VERSION=		2.1.0

CATEGORIES=		optimization
COMMENT=		Optimal control library for robot under contact sequence
LICENSE=		2-clause-bsd
MAINTAINER=		guilhem.saurel@laas.fr

USE_PYTHON=		true
PYTHON_SELF_CONFLICT=	yes

# parallel builds exhaust memory - until a better solution is found
MAKE_JOBS_SAFE=		no

DEPEND_ABI.pinocchio=	pinocchio>=2.6.3
DEPEND_ABI.python=	python>=3

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../graphics/urdfdom/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../math/py-pinocchio/depend.mk
include ../../optimization/ipopt/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../robots/example-robot-data/depend.mk
include ../../robots/py-example-robot-data/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/py-scipy.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

include ../../mk/robotpkg.mk
