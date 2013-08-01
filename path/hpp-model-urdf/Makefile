# robotpkg Makefile for:	path/hpp-model-urdf
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

HPP_PACKAGE=		hpp-model-urdf
HPP_VERSION=		0.3
PKGREVISION=
MASTER_REPOSITORY=	git git@github.com:laas/hpp-model-urdf

CATEGORIES=	path
HPP_COMMENT=	parse urdf files for Kineo
LICENSE=	gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

include ../../devel/hpp-model/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../graphics/rcpdf/depend.mk
include ../../graphics/ros-robot-model/depend.mk
include ../../math/hpp-geometry/depend.mk
include ../../mk/sysdep/assimp2.mk

include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
