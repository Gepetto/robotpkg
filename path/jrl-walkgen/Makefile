# robotpkg Makefile for:	path/jrl-walkgen
# Created:			Anthony Mallet on Tue, 15 May 2007
#

DISTNAME=	walkgenjrl-${VERSION}
PKGNAME=	jrl-walkgen-${VERSION}
VERSION=	3.0.3

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-walkgen/}
MASTER_REPOSITORY=	git@github.com:jrl-umi3218/jrl-walkgen.git

USE_LANGUAGES+=fortran c c++

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/jrl/spip/-Walk-Pattern-Generator-.html
COMMENT=	Walk pattern generator for the HRP-2 humanoid robot.
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=		c++ fortran
DOXYGEN_PLIST_DIR+=	share/doc/walkGenJrl

PKG_SUPPORTED_OPTIONS+= debug
PKG_OPTION_DESCR.debug=	Compile in debugging mode
PKG_OPTION_SET.debug:=	CMAKE_ARGS+= -DCMAKE_BUILD_TYPE=Debug

include ../../mk/sysdep/cmake.mk
include ../../math/jrl-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
