# robotpkg Makefile for:	motion/sot-dynamic
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

VERSION=		2.6.0
PKGREVISION=		
DISTNAME=		sot-dynamic-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-dynamic/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/jrl-umi3218/sot-dynamic

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
LICENSE=	gnu-lgpl-v3
COMMENT=	Hierarchical task based control of humanoid robots

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/sot-dynamic
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../motion/sot-core/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../robots/hrp2-10/depend.mk
include ../../robots/hrp2-14/depend.mk
include ../../math/hrp2-dynamics/depend.mk
include ../../math/hrp2-10-optimized/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

_pycompiledir=${PREFIX}/${PYTHON_SITELIB}/dynamic_graph/sot/dynamics
post-install: python-compile-all(${_pycompiledir})
