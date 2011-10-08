# robotpkg Makefile for:	devel/hpp-util
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

VERSION=		0.4c
PKGREVISION=		1
DISTNAME=		hpp-util-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-util/}
MASTER_REPOSITORY=	git git://github.com/laas/hpp-util.git


CATEGORIES=		devel
COMMENT=		Technical tools shared amongst HPP
MAINTAINER=		hpp@laas.fr
LICENSE=		gnu-gpl-v3

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hpp-util
CMAKE_ARGS+=		-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include
CMAKE_ARGS+=		-DBOOST_LIBRARYDIR=${PREFIX.boost-libs}/lib

PKG_SUPPORTED_OPTIONS+=		verbose
PKG_OPTION_DESCR.verbose=	Compile in verbose mode
PKG_OPTION_SET.verbose=		CXXFLAGS+=-DHPP_DEBUG

PKG_SUPPORTED_OPTIONS+=		benchmark
PKG_OPTION_DESCR.benchmark=	Measure computation times
PKG_OPTION_SET.benchmark=	CXXFLAGS+=-DHPP_ENABLE_BENCHMARK

PKG_SUGGESTED_OPTIONS+=		verbose benchmark

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
