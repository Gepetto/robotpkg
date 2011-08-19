# robotpkg Makefile for:	path/hpp-walkplanner
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

DISTNAME=	hpp-walkplanner-${PKGVERSION_NOREV}
PKGNAME=	hpp-walkplanner-${PKGVERSION}
PKGVERSION=	3.4.1
PKGREVISION=

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-walkplanner/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-walkplanner

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Path planning algorithm for a walking humanoid robot.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/hpp-walkplanner

# options
PKG_SUPPORTED_OPTIONS+=	verbose
PKG_OPTION_DESCR.verbose=	Compile in verbose mode
PKG_OPTION_SET.verbose:=	CPPFLAGS+=-DHPP_DEBUG

PKG_SUPPORTED_OPTIONS+=	benchmark
PKG_OPTION_DESCR.benchmark=	Measure computation times
PKG_OPTION_SET.benchmark:=	CPPFLAGS+=-DHPP_ENABLE_BENCHMARK -DHPP_DEBUG

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../path/jrl-walkgen/depend.mk
include ../../path/hpp-walkfootplanner/depend.mk
include ../../path/hpp-core/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
