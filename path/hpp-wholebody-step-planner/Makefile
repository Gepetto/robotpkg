# robotpkg Makefile for:	path/hpp-wholebody-step-planner
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		hpp-wholebody-step-planner
HPP_VERSION=		1.0
PKGREVISION=
MASTER_REPOSITORY=	git git@github.com:laas/hpp-wholebody-step-planner

CATEGORIES=		path
HPP_COMMENT=		Whole-body walk planning for humanoid robots
LICENSE=		gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../path/hpp-kwsplus/depend.mk
include ../../path/hpp-util/depend.mk
include ../../path/hpp-constrained-planner/depend.mk
include ../../path/hpp-constrained/depend.mk
include ../../path/hpp-roboptim/depend.mk
include ../../mk/sysdep/assimp2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
