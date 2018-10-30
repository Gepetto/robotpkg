# robotpkg Makefile for:	math/py27-eigenpy
# Created:			Olivier Stasse, Feb 3rd 2016
#

ORG=			stack-of-tasks
NAME=			eigenpy
VERSION=		1.5.0

DISTNAME=		${NAME}-${VERSION}
PKGNAME=		${PKGTAG.python-}${DISTNAME}

HOMEPAGE=		${MASTER_SITE_GITHUB:=${ORG}/${NAME}}
MASTER_SITES=	${HOMEPAGE}/releases/download/v${VERSION}/
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/${ORG}/${NAME}
CHECKOUT_VCS_OPTS+=	--recursive

MAINTAINER=		hpp@laas.fr
CATEGORIES=		math
COMMENT=		Eigen bindings to python
LICENSE=		gnu-lgpl-v3

# this does not support multiple parallel python version
CONFLICTS+=		py[0-9][0-9]-eigenpy-[0-9]*
# old package name
CONFLICTS+=		eigenpy-[0-9]*

CMAKE_ARGS+=		-Wno-dev # annoying messages
CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}
CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

# disable doxygen
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF
CMAKE_ARGS+=		-DDOXYGEN_EXECUTABLE=${FALSE}

USE_BOOST_LIBS=		python
Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}


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
