# robotpkg Makefile for:	motion/dynamic-graph
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DISTNAME=		dynamic-graph-${VERSION}
VERSION=		2.5.3

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/jrl-umi3218/dynamic-graph

COMMENT=		Efficient data-flow C++ library for robotics
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gepetto@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/dynamic-graph

# disable -Werror because of x86_64 warnings (must be fixed upstream) and
# boost + gcc that don't cohabit well depending on their respective versions
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

# man pages location
CMAKE_ARGS+=		-DMANDIR=${PREFIX}/${PKGMANDIR}

include ../../interfaces/jrl-mal/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
