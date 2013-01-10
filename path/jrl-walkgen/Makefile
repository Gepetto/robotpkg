# robotpkg Makefile for:	path/jrl-walkgen
# Created:			Anthony Mallet on Tue, 15 May 2007
#

DISTNAME=	jrl-walkgen-${VERSION}
PKGNAME=	jrl-walkgen-${VERSION}
VERSION=	3.1.5

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-walkgen/}
MASTER_REPOSITORY=	git git@github.com:jrl-umi3218/jrl-walkgen.git


MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/jrl/spip/-Walk-Pattern-Generator-.html
COMMENT=	Walk pattern generator for the HRP-2 humanoid robot.
LICENSE=	gnu-lgpl-v3

DOXYGEN_PLIST_DIR+=	share/doc/jrl-walkgen

PKG_SUPPORTED_OPTIONS+= debug
PKG_OPTION_DESCR.debug=	Compile in debugging mode
PKG_OPTION_SET.debug:=	CMAKE_ARGS+= -DCMAKE_BUILD_TYPE=Debug

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../mk/sysdep/cmake.mk
include ../../math/jrl-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
