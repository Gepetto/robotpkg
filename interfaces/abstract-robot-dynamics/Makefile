# robotpkg Makefile for:	interfaces/abstract-robot-dynamics
# Created:			Anthony Mallet on Mon, 14 May 2007
#

DISTNAME=	abstract-robot-dynamics-${VERSION}
PKGNAME=	abstract-robot-dynamics-${VERSION}
VERSION=	1.16.2

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=abstract-robot-dynamics/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}abstractRobotDynamics

DOXYGEN_PLIST_DIR+=	share/doc/abstract-robot-dynamics

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for dynamic robot model.
LICENSE =	original-bsd

USE_LANGUAGES+=	c c++
CMAKE_ARGS+= -DCXX_DISABLE_WERROR=TRUE

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../interfaces/jrl-mal/depend.mk

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
