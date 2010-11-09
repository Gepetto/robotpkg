# robotpkg Makefile for:	math/jrl-mathtools
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DISTNAME=	jrlmathtools-1.3.0
PKGNAME=	jrl-mathtools-1.3.0

CATEGORIES=	math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-mathtools/}
MASTER_REPOSITORY=	git http://github.com/jrl-umi3218/jrl-mathtools.git

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	https://github.com/jrl-umi3218/jrl-mathtools
COMMENT=	Basic mathematical tools used in the JRL software.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+=		c c++ fortran
DOXYGEN_PLIST_DIR+=	share/doc/jrlMathTools

CMAKE_ARGS+=	-DBOOSTNUMERICBINDINGS_DIR=${PREFIX.boost-numeric-bindings}

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
include ../../devel/boost-numeric-bindings/depend.mk
