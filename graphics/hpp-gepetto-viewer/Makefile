# robotpkg Makefile for:	graphics/hpp-gepetto-viewer
# Created:			Florent Lamiraux on Mon, 9 Mar 2015
#

HPP_PACKAGE=		hpp-gepetto-viewer
HPP_VERSION=		1.0.0
PKGREVISION=		1

CATEGORIES=		graphics
HPP_COMMENT=		Bridge between hpp-corbaserver and gepetto-viewer-corba
LICENSE=		gnu-lgpl-v3

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../graphics/gepetto-viewer-corba/depend.mk
include ../../path/hpp-corbaserver/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
