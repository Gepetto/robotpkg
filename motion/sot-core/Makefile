# robotpkg Makefile for:	motion/sot-core
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

VERSION=		2.5
PKGREVISION=		4
DISTNAME=		sot-core-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-core/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL}sot-core

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
COMMENT=	Hierarchical task based control of humanoid robots
LICENSE=	gnu-lgpl-v3

# TODO: split into sot-core and py-sot-core
USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/sot-core
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

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
