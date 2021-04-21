# robotpkg Makefile for:	math/ndcurves
# Created:			Guilhem Saurel on Tue, 16 Mar 2021
#

ORG=			loco-3d
NAME=			ndcurves
VERSION=		1.1.0

CATEGORIES=		math
COMMENT=		Library for creating curves

CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

include ../../devel/jrl-cmakemodules/Makefile.common

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
