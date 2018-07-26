# robotpkg Makefile for:	path/hpp-corbaserver
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

HPP_PACKAGE=	hpp-corbaserver
HPP_COMMENT=	Corba server for Humanoid Path Planner

CONFIGURE_DIRS=	build
CMAKE_ARG_PATH=	..
CATEGORIES=	path

MAKE_JOBS_SAFE= no

include ../../meta-pkgs/hpp/Makefile.common

include ../../math/hpp-pinocchio/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../path/hpp-core/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c++.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
