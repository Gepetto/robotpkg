# robotpkg Makefile for:	math/py-pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

ORG=			stack-of-tasks
NAME=			pinocchio
VERSION=		2.2.2

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics (python bindings)
HOMEPAGE=		http://${ORG}.github.io/${NAME}/
MAINTAINER=		gepetto@laas.fr
LICENSE=		2-clause-bsd

CMAKE_ARGS+=		-DBUILD_WITH_COLLISION_SUPPORT=ON

USE_BOOST_LIBS=		python
Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}

DEPEND_ABI.pinocchio=	pinocchio>=2.2.2
USE_PYTHON_ONLY=	true
USE_MASTER_GITHUB=	true

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../path/py-hpp-fcl/depend.mk
include ../../mapping/octomap/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk

DEPEND_ABI.cmake +=		cmake>=2.8.12
DEPEND_ABI.boost-headers +=	boost-headers>=1.55

include ../../mk/robotpkg.mk
