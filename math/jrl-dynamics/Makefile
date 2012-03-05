# robotpkg Makefile for:	math/jrl-dynamics
# Created:			Anthony Mallet on Mon, 14 May 2007
#

DISTNAME=	jrl-dynamics-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.21.0
PKGREVISION=	1

CATEGORIES=	math
NO_PUBLIC_SRC=	yes
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-dynamics/}
MASTER_REPOSITORY=	git git@github.com:jrl-umi3218/jrl-dynamics.git

MAINTAINER=	openrobots@laas.fr
COMMENT=	JRL-Japan implementation of dynamic robot.
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=	c c++

DOXYGEN_PLIST_DIR+=	share/doc/jrl-dynamics

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../interfaces/jrl-mal/depend.mk
include ../../interfaces/abstract-robot-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
