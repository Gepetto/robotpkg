# robotpkg Makefile for:	math/jrl-mathtools
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DISTNAME=	jrl-mathtools-1.5
PKGNAME=	jrl-mathtools-1.5

CATEGORIES=	math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-mathtools/}
MASTER_REPOSITORY=	git http://github.com/jrl-umi3218/jrl-mathtools.git

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	https://github.com/jrl-umi3218/jrl-mathtools
COMMENT=	Basic mathematical tools used in the JRL software.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+=		c c++ fortran
DOXYGEN_PLIST_DIR+=	share/doc/jrl-mathtools

CMAKE_ARGS+=	-DBOOSTNUMERICBINDINGS_DIR=${PREFIX.boost-numeric-bindings} \
	-DCXX_DISABLE_WERROR=True

include ../../math/boost-numeric-bindings-v1/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
