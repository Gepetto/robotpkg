# robotpkg Makefile for:	path/hpp-wholebody-step
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		hpp-wholebody-step
HPP_VERSION=		4.10.1

CATEGORIES=		path
HPP_COMMENT=		Whole-body walk planning for humanoid robots

include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=		-DBUILD_TESTING=FALSE

include ../../devel/log4cxx/depend.mk
include ../../mapping/octomap/depend.mk
include ../../optimization/roboptim-trajectory/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-walkgen/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
