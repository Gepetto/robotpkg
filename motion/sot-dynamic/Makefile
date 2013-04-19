# robotpkg Makefile for:	motion/sot-dynamic
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

VERSION=		2.7.2
DISTNAME=		sot-dynamic-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-dynamic/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/jrl-umi3218/sot-dynamic

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
LICENSE=	gnu-lgpl-v3
COMMENT=	Create entities to compute a robot dynamics properties

DYNAMIC_PLIST_DIRS+=	share/doc/sot-dynamic
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../math/jrl-dynamics/depend.mk
include ../../motion/py-sot-tools/depend.mk
include ../../motion/sot-core/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
