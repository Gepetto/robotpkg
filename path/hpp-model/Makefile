# robotpkg Makefile for:	path/hpp-model
# Created:			Anthony Mallet on Mon, 18 Feb 2008
#

PKGREVISION=
HPP_PACKAGE=		hpp-model
HPP_VERSION=		3.1.1

CATEGORIES=	path
HPP_COMMENT=	robots, joints and bodies with dynamics properties
LICENSE=	gnu-lgpl-v2

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

# Needs eigen3 >= 3.2: override PREFER defaults where needed
DEPEND_ABI.eigen3 += eigen3>=3.2.0
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04,${OS_VERSION}))
    PREFER.eigen3?=	robotpkg
  endif
else ifeq (OpenNao,${OPSYS})
  PREFER.eigen3?=	robotpkg
endif

include ../../path/hpp-util/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
