# robotpkg Makefile for:	path/hpp-constrained-planner
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		hpp-constrained-planner
HPP_VERSION=		1.0.1
MASTER_REPOSITORY=	git git@github.com:laas/hpp-constrained-planner

CATEGORIES=		path
HPP_COMMENT=		Humanoid motion planning on constrained manifolds
LICENSE=		gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../path/hpp-util/depend.mk
include ../../path/hpp-constrained/depend.mk
include ../../path/hpp-core/depend.mk
include ../../mk/sysdep/assimp2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
