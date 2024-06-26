# robotpkg Makefile for:	math/jrl-dynamics-urdf
# Created:			Olivier Stasse on Thu, 27 Jun 2013
#
DISTNAME=		jrl-dynamics-urdf-2.2.0
PKGREVISION=		5
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-dynamics-urdf/}
MASTER_REPOSITORY=	git git://github.com/laas/jrl_dynamics_urdf.git

CATEGORIES=		math
COMMENT=		JRL-Japan implementation of dynamic robot
LICENSE=		gnu-lgpl-v3
MAINTAINER=		hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/jrl-dynamics-urdf
USE_BOOST_LIBS+=	filesystem system

CMAKE_ARGS+=		-DGTEST_ROOT=${PREFIX.googletest}

include ../../sysutils/ros-rospack/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../interfaces/jrl-mal/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../net/ros-resource-retriever/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/bullet.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/googletest.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.urdfdom+=		urdfdom<1
DEPEND_ABI.urdfdom-headers+=	urdfdom-headers<1

# NetBSD does not have system urdfdom, so the above constraint makes it
# impossible to bulk-build the robotpkg urdfdom-1.0.4 package.
NOT_FOR_PLATFORM=	NetBSD-%

include ../../mk/robotpkg.mk
