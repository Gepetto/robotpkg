# robotpkg Makefile for:	math/jrl-dynamics-urdf
# Created:			Olivier Stasse on Thu, 27 Jun 2013
#
DISTNAME=		jrl-dynamics-urdf-2.2.0
PKGREVISION=		3
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-dynamics-urdf/}
MASTER_REPOSITORY=	git git://github.com/laas/jrl_dynamics_urdf.git

CATEGORIES=		math
COMMENT=		JRL-Japan implementation of dynamic robot
LICENSE=		gnu-lgpl-v3
MAINTAINER=		hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/jrl-dynamics-urdf
USE_BOOST_LIBS+=	filesystem system

CMAKE_ARGS+=		-DGTEST_ROOT=${PREFIX.googletest}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../sysutils/ros-rospack/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../interfaces/jrl-mal/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../simulation/bullet/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../net/ros-resource-retriever/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/googletest.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
