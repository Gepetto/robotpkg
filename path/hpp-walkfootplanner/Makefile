# robotpkg Makefile for:	path/hpp-walkfootplanner
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DISTNAME=	hpp-walkfootplanner-${VERSION}
VERSION=	2.4
PKGREVISION=	

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-walkfootplanner/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-walkfootplanner

MAINTAINER=	hpp@laas.fr
COMMENT=	Collision free walk path planning for a humanoid robot.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes

DOXYGEN_PLIST_DIR+=	share/doc/hpp-walkfootplanner

# options
PKG_SUPPORTED_OPTIONS+=	verbose
PKG_OPTION_DESCR.verbose=	Compile in verbose mode
PKG_OPTION_SET.verbose:=	CPPFLAGS+=-DHPP_DEBUG

PKG_SUPPORTED_OPTIONS+=	benchmark
PKG_OPTION_DESCR.benchmark=	Measure computation times
PKG_OPTION_SET.benchmark:=	CPPFLAGS+=-DHPP_ENABLE_BENCHMARK -DHPP_DEBUG

include ../../mk/sysdep/doxygen.mk
include ../../math/jrl-mathtools/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../path/hpp-core/depend.mk
include ../../optimization/roboptim-trajectory/depend.mk
include ../../optimization/roboptim-core-cfsqp-plugin/depend.mk
DEPEND_ABI.boost-headers?=	boost-headers>=1.35
include ../../devel/boost-headers/depend.mk
DEPEND_ABI.boost-libs?=		boost-libs>=1.35
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
