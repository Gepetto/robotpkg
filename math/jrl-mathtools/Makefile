# robotpkg Makefile for:	math/jrl-mathtools
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

PKGREVISION=		2
DISTNAME=		jrl-mathtools-1.5
CATEGORIES=		math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-mathtools/}
MASTER_REPOSITORY=	git http://github.com/jrl-umi3218/jrl-mathtools.git

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	https://github.com/jrl-umi3218/jrl-mathtools
COMMENT=	Basic mathematical tools used in the JRL software
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=		c c++ fortran
DOXYGEN_PLIST_DIR+=	share/doc/jrl-mathtools

CMAKE_ARGS+=	-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include
CMAKE_ARGS+=	-DBOOST_LIBRARYDIR=${PREFIX.boost-libs}/lib

DEPEND_ABI.boost-headers=	boost-headers>=1.40
DEPEND_ABI.boost-libs=		boost-libs>=1.40

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/lapack/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
