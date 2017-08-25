# robotpkg Makefile for:	path/hpp-manipulation-corba
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=	        hpp-manipulation-corba
HPP_VERSION=		1.1.0
PKGREVISION=		1

CATEGORIES=		path
HPP_COMMENT=		CORBA interface for hpp-manipulation
LICENSE=		gnu-gpl-v3

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

# omniorb has some issue with parallelism. Error message omniidl: Cannot rename
# "foo/new__init__.py" to "foo/__init__.py"
MAKE_JOBS_SAFE=		no

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../middleware/omniORB/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../path/hpp-corbaserver/depend.mk
include ../../path/hpp-manipulation-urdf/depend.mk
include ../../path/hpp-manipulation/depend.mk
include ../../path/hpp-model/depend.mk
include ../../path/hpp-util/depend.mk
include ../../path/hpp-wholebody-step-corba/depend.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/latex.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
