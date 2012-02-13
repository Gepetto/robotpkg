# robotpkg Makefile for:	motion/dynamic-graph
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DISTNAME=		dynamic-graph-${VERSION}
VERSION=		2.5.1
PKGREVISION=		1
CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL}dynamic-graph

COMMENT=		Efficient data-flow C++ library for robotics
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gepetto@laas.fr

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/dynamic-graph

include ../../mk/robotpkg.prefs.mk # MACHINE_ARCH
ifeq (x86_64,${MACHINE_ARCH})
  # disable -Werror on x86_64: too many warnings, must be fixed upstream
  CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
endif

include ../../interfaces/jrl-mal/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
