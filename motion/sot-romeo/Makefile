# robotpkg Makefile for:	robots/sot-romeo
# Created:			Aurelie Clodic on Fri, 20 Jun 2014
#

DISTNAME=		sot-romeo-1.1.0
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}stack-of-tasks/${PKGBASE}

CATEGORIES=		robots
COMMENT=		Generic "stack of tasks" library for the Romeo robot
LICENSE=		gnu-lgpl-v3
MAINTAINER=		hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/sot-romeo

include ../../motion/dynamic-graph-bridge/depend.mk
include ../../motion/dynamic-graph/depend.mk
include ../../motion/py-dynamic-graph/depend.mk
include ../../motion/py-sot-tools/depend.mk
include ../../motion/sot-core/depend.mk
include ../../motion/sot-dynamic/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
