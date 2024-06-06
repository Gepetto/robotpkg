# robotpkg Makefile for:	math/py27-eigenpy
# Created:			Olivier Stasse, Feb 3rd 2016
#

ORG=			stack-of-tasks
NAME=			eigenpy
VERSION=		3.6.0

CATEGORIES=		math
COMMENT=		Eigen bindings to python

PYTHON_SELF_CONFLICT=	yes
PYTHON_NOTAG_CONFLICT=	yes

CMAKE_ARGS+=		-Wno-dev # annoying messages
CMAKE_ARGS+=		-DBUILD_UNIT_TESTS=ON

# disable doxygen
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF
CMAKE_ARGS+=		-DDOXYGEN_EXECUTABLE=${FALSE}

USE_BOOST_LIBS=		python
Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}

USE_MASTER_GITHUB=	true

# parallel builds exhaust memory - until a better solution is found
MAKE_JOBS_SAFE=		no

include ../../devel/jrl-cmakemodules/Makefile.common

DEPEND_METHOD.eigen3+=	full
DEPEND_ABI.python=	python>=3

include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/py-scipy.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
