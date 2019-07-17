# robotpkg Makefile for:	math/py27-eigenpy
# Created:			Olivier Stasse, Feb 3rd 2016
#

ORG=			stack-of-tasks
NAME=			eigenpy
VERSION=		1.6.0

MAINTAINER=		hpp@laas.fr
CATEGORIES=		math
COMMENT=		Eigen bindings to python
LICENSE=		2-clause-bsd

# this does not support multiple parallel python version
CONFLICTS+=		py[0-9][0-9]-eigenpy-[0-9]*
# old package name
CONFLICTS+=		eigenpy-[0-9]*

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
USE_PYTHON=		true

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
