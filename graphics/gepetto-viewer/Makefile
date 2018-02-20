# robotpkg Makefile for:	graphics/gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

HPP_PACKAGE=		gepetto-viewer
HPP_VERSION=		2.1.2

CATEGORIES=			graphics
HPP_COMMENT=		Simple viewer based on OpenSceneGraph
LICENSE=			2-clause-bsd

MASTER_SITES=		${MASTER_SITE_GITHUB:=humanoid-path-planner/${HPP_PACKAGE}/releases/download/v${HPP_VERSION}/}

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

DEPEND_ABI.openthreads+= openthreads>=2
DEPEND_ABI.openscenegraph+= openscenegraph>=3.2

include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../mk/sysdep/openscenegraph.mk
include ../../mk/sysdep/openthreads.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
