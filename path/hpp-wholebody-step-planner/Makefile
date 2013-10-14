# robotpkg Makefile for:	path/hpp-wholebody-step-planner
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		hpp-wholebody-step-planner
HPP_VERSION=		0.3
MASTER_REPOSITORY=	git git@github.com:laas/hpp-wholebody-step-planner

CATEGORIES=		path
HPP_COMMENT=		Whole-body walk planning for humanoid robots
LICENSE=		gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../devel/hpp-kwsplus/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../path/hpp-constrained-planner/depend.mk
include ../../path/hpp-constrained/depend.mk
include ../../path/hpp-roboptim/depend.mk
include ../../mk/sysdep/assimp2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
