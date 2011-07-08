# robotpkg Makefile for:	path/hpp-gik
# Created:			Anthony Mallet on Thu, 28 Jun 2007
#

DISTNAME=	dynamic-graph-corba-${VERSION}
PKGNAME=	dynamic-graph-corba-${VERSION}
VERSION=	2.5

CATEGORIES=	motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph-corba/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_LAAS:=dynamic-graph-corba}
LICENSE=	gnu-lgpl-v3

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Corba server, client and signals for dynamic-graph

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/dynamic-graph-corba

include ../../motion/dynamic-graph-python/depend.mk
include ../../motion/sot-core/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../middleware/hpp-template-corba/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
