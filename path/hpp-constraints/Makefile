# robotpkg Makefile for:	path/hpp-constraints
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-constraints

CATEGORIES=		path
HPP_COMMENT=		Define non-linear constraints on robot configurations

include ../../meta-pkgs/hpp/Makefile.common

DEPEND_ABI.g++ += g++>=4.6
DEPEND_ABI.eigen3 += eigen3>=3.2.2

DYNAMIC_PLIST_DIRS+=	share/doc/hpp-constraints

include ../../math/eigen3/depend.mk
include ../../math/hpp-pinocchio/depend.mk
include ../../path/hpp-statistics/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../optimization/qpoases/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
