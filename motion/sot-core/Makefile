# robotpkg Makefile for:	motion/sot-core
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

VERSION=		2.6.0
PKGREVISION=		2
DISTNAME=		sot-core-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-core/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL}sot-core

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
COMMENT=	Hierarchical task based control of humanoid robots
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/sot-core

CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../motion/py-dynamic-graph/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/py-sphinx.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

post-install: python-compile-all(${PREFIX}/${PYTHON_SITELIB}/dynamic_graph/sot)
