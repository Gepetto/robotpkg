# robotpkg Makefile for:	devel/hpp-corbaserver
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

HPP_PACKAGE=	hpp-corbaserver
HPP_VERSION=	2.1.1
PKGREVISION=
HPP_COMMENT=	Corba server for Humanoid Path Planner

CATEGORIES=	devel
MASTER_REPOSITORY=	git git@github.com:laas/hpp-corbaserver.git

LICENSE=	gnu-lgpl-v3

MAKE_JOBS_SAFE= no
HPP_BUILD_SYSTEM=	cmake

include ../../devel/hpp-util/depend.mk
include ../../meta-pkgs/hpp/Makefile.common
include ../../middleware/omniORB/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-model-urdf/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
