# robotpkg Makefile for:	path/hpp-manipulation
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=		hpp-manipulation
HPP_COMMENT=		Manipulation problem definition and resolution

CATEGORIES=		path

CMAKE_ARGS+=		-DBUILD_TESTING=OFF

include ../../meta-pkgs/hpp/Makefile.common

include ../../devel/log4cxx/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/hpp-pinocchio/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-statistics/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
