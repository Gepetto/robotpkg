# robotpkg Makefile for:	motion/dynamic-graph-corba
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

VERSION=		2.5
PKGREVISION=		1
DISTNAME=		dynamic-graph-corba-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph-corba/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL}dynamic-graph-corba

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
COMMENT=	Corba server, client and signals for dynamic-graph
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/dynamic-graph-corba

include ../../motion/py-dynamic-graph/depend.mk
include ../../motion/sot-core/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../middleware/hpp-template-corba/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
