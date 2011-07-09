# robotpkg Makefile for:	motion/sot-core
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DISTNAME=	sot-core-${VERSION}
PKGNAME=	sot-core-${VERSION}
VERSION=	2.5

CATEGORIES=	motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-core/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL:=sot-core}
LICENSE=	gnu-lgpl-v3

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Hierarchical task based control of humanoid robots

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/sot-core

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../motion/dynamic-graph-python/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
