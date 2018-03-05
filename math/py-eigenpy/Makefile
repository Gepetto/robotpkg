# robotpkg Makefile for:	math/py27-eigenpy
# Created:			Olivier Stasse, Feb 3rd 2016
#

VERSION=		1.4.1
PKGNAME=		${PKGTAG.python-}eigenpy-${VERSION}
DISTNAME=		eigenpy-${VERSION}

MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=stack-of-tasks/eigenpy/releases/download/v${VERSION}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/stack-of-tasks/eigenpy
CHECKOUT_VCS_OPTS+=	--recursive

MAINTAINER=		hpp@laas.fr
CATEGORIES=		math
COMMENT=		Eigen bindings to python
LICENSE=		gnu-lgpl-v3

# this does not support multiple parallel python version
CONFLICTS+=		py[0-9][0-9]-${PKGBASE}-[0-9]*
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

DEPEND_ABI.python+=	python<3

include ../../mk/robotpkg.mk
