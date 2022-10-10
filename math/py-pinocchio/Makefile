# robotpkg Makefile for:	math/py-pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

ORG=			stack-of-tasks
NAME=			pinocchio
VERSION=		2.6.9

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics (python bindings)
HOMEPAGE=		http://${ORG}.github.io/${NAME}/

CMAKE_ARGS+=		-DBUILD_WITH_COLLISION_SUPPORT=ON
CMAKE_ARGS+=		-DBUILD_BENCHMARK=OFF
CMAKE_ARGS+=		-DBUILD_TESTING=OFF

USE_BOOST_LIBS=		python
Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBUILD_WITH_LIBPYTHON=OFF

DEPEND_ABI.pinocchio=	pinocchio>=${VERSION}
USE_PYTHON_ONLY=	true
USE_MASTER_GITHUB=	true

# parallel builds exhaust memory - until a better solution is found
MAKE_JOBS_SAFE=		no

include ../../devel/jrl-cmakemodules/Makefile.common

# On Debian 9, the combination of GCC version / default args
# and Boost version raises:
# error: unable to find numeric literal operator 'operator""Q'
include ../../mk/robotpkg.prefs.mk # OPSYS / OS_VERSION
ifeq (Debian,${OPSYS})
  ifeq (9,${OS_VERSION})
    CXXFLAGS+=		-DBOOST_MATH_DISABLE_FLOAT128
  endif
endif

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

DEPEND_ABI.boost-headers +=	boost-headers>=1.55

include ../../mk/robotpkg.mk
