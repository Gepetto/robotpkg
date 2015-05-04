# robotpkg Makefile for:	path/hpp-corbaserver
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

PKGREVISION=
HPP_PACKAGE=	hpp-corbaserver
HPP_VERSION=	3.1.0
HPP_COMMENT=	Corba server for Humanoid Path Planner

CONFIGURE_DIRS=	build
CMAKE_ARG_PATH=	..
CATEGORIES=	path
LICENSE=	gnu-lgpl-v3

MAKE_JOBS_SAFE= no
HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../middleware/omniORB/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-model-urdf/depend.mk
include ../../path/hpp-util/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c++.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
