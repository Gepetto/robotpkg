# robotpkg Makefile for:	math/eiquadprog
# Created:			Guilhem Saurel on Tue, 17 Sep 2019
#

ORG=			stack-of-tasks
NAME=			eiquadprog
VERSION=		1.2.1

CATEGORIES=		math
COMMENT=		algorithm of Goldfarb and Idnani for the solution of a QP
LICENSE=		gnu-lgpl-v3

DEPEND_ABI.eigen3+=	eigen3>=3.2.92

include ../../devel/jrl-cmakemodules/Makefile.common
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
