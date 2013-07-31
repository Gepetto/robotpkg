# robotpkg Makefile for:	path/hpp-gik
# Created:			Anthony Mallet on Thu, 28 Jun 2007
#

HPP_PACKAGE=		hpp-gik
HPP_VERSION=		2.10
HPP_COMMENT=		Generalized Inverse Kinematics for humanoid robots
HPP_BUILD_SYSTEM=	cmake
PKGREVISION=
CATEGORIES=		path

MASTER_REPOSITORY=	git git@github.com:laas/hpp-gik

LICENSE=		gnu-lgpl-v3

CMAKE_ARGS+=		-DDISABLE_TEST=YES

INCLUDE_DIRS.boost-headers=	include

include ../../meta-pkgs/hpp/Makefile.common
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../interfaces/abstract-gik-task/depend.mk
include ../../interfaces/abstract-robot-dynamics/depend.mk
include ../../interfaces/jrl-mal/depend.mk
include ../../math/boost-numeric-bindings-v1/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
