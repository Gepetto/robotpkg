# robotpkg Makefile for:	motion/sot-core
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

VERSION=		2.5
PKGREVISION=		1
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

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../motion/py-dynamic-graph/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
