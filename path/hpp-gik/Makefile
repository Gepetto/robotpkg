# robotpkg Makefile for:	path/hpp-gik
# Created:			Anthony Mallet on Thu, 28 Jun 2007
#

DISTNAME=		hpp-gik-${VERSION}
VERSION=		2.8
PKGREVISION=		1
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-gik/}
MASTER_REPOSITORY=	git git@github.com:laas/hpp-gik

COMMENT=		Generalized Inverse Kinematics for humanoid robots
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gepetto@laas.fr

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hpp-gik
CMAKE_ARGS+=		-DDISABLE_TEST=YES

INCLUDE_DIRS.boost-headers=	include

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../interfaces/abstract-gik-task/depend.mk
include ../../interfaces/abstract-robot-dynamics/depend.mk
include ../../interfaces/jrl-mal/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
