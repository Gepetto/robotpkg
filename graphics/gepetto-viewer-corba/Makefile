# robotpkg Makefile for:	graphics/gepetto-viewer-corba
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer-corba
HPP_VERSION=		1.2.0
PKGREVISION=		1

CATEGORIES=		graphics
HPP_COMMENT=		Corba server and client for to control gepetto viewer
LICENSE=		gnu-lgpl-v3

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

DEPEND_ABI.python=	python<3

include ../../graphics/gepetto-viewer/depend.mk
include ../../math/eigen3/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../mk/sysdep/openscenegraph.mk
include ../../mk/sysdep/openscenegraph-qt.mk
include ../../mk/sysdep/openthreads.mk
include ../../mk/sysdep/py-qt4.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt4-libs.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
