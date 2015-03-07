# robotpkg Makefile for:	path/hpp-wholebody-step-corba
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

PKGREVISION=
HPP_PACKAGE=		hpp-wholebody-step-corba
HPP_VERSION=		3.1.0

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..
CATEGORIES=		path
HPP_COMMENT=		CORBA server and client for whole-body walk planning
LICENSE=		gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../middleware/hpp-template-corba/depend.mk
include ../../path/hpp-corbaserver/depend.mk
include ../../path/hpp-util/depend.mk
include ../../path/hpp-wholebody-step/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
