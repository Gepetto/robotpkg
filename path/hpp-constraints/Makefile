# robotpkg Makefile for:	path/hpp-constraints
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		hpp-constraints
HPP_VERSION=		3.1.0

CATEGORIES=		path
HPP_COMMENT=		Define non-linear constraints on robot configurations
LICENSE=		gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

# Needs eigen3 >= 3.2: override PREFER defaults where needed
DEPEND_ABI.eigen3 += eigen3>=3.2.0
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04,${OS_VERSION}))
    PREFER.eigen3?=	robotpkg
  endif
endif

include ../../math/eigen3/depend.mk
include ../../path/hpp-model/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
