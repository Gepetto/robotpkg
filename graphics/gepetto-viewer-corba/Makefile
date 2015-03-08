# robotpkg Makefile for:	graphics/gepetto-viewer-corba
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer-corba
HPP_VERSION=		1.0.0
PKGREVISION=

CATEGORIES=		graphics
HPP_COMMENT=		Corba server and client for to control gepetto viewer
LICENSE=		gnu-lgpl-v3

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../graphics/gepetto-viewer/depend.mk
include ../../math/eigen3/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/openthreads.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
