# robotpkg Makefile for:	motion/dynamic-graph-python
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DISTNAME=	dynamic-graph-python-${VERSION}
PKGNAME=	dynamic-graph-python-${VERSION}
VERSION=	2.5

CATEGORIES=	motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph-python/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL:=dynamic-graph-python}
LICENSE=	gnu-lgpl-v3

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Python bindings for dynamic-graph

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/dynamic-graph-python

include ../../motion/dynamic-graph/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
