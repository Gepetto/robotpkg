# robotpkg Makefile for:	motion/dynamic-graph
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DISTNAME=	dynamic-graph-${VERSION}
PKGNAME=	dynamic-graph-${VERSION}
VERSION=	2.5

CATEGORIES=	motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL:=dynamic-graph}
LICENSE=	gnu-lgpl-v3

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Implementation of dynamic data flow

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/dynamic-graph

include ../../interfaces/jrl-mal/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
