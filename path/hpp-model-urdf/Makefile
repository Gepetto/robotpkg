# robotpkg Makefile for:	path/hpp-model-urdf
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

HPP_PACKAGE=		hpp-model-urdf
HPP_VERSION=		3.1.0

CATEGORIES=	path
HPP_COMMENT=	parse urdf files for hpp
LICENSE=	gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

include ../../graphics/assimp/depend.mk
include ../../graphics/ros-robot-model/depend.mk
include ../../graphics/ros-srdfdom/depend.mk
include ../../path/hpp-model/depend.mk
include ../../path/hpp-util/depend.mk

include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
