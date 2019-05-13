# robotpkg Makefile for:	simulation/openhrp3
# Created:			Anthony Mallet on Thu, 24 Aug 2017
#

VERSION=	3.1.9
DISTNAME=	openhrp3-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
MASTER_SITES=	${MASTER_SITE_GITHUB:=fkanehiro/openhrp3/archive/}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	simulation
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://fkanehiro.github.io/openhrp3-doc/en/index.html
COMMENT=	Open Architecture Humanoid Robotics Platform
LICENSE=	eclipse

MAKE_JOBS_SAFE=	no # because multiple parallel omniidl won't work

CMAKE_ARGS+=	-Wno-dev
CMAKE_ARGS+=	-DENABLE_INSTALL_RPATH=TRUE
CMAKE_ARGS+=	-DENABLE_DOXYGEN=FALSE
CMAKE_ARGS+=	-DCOMPILE_SAMPLES=FALSE

CMAKE_ARGS+=	-DEIGEN_INCLUDE_DIR=${PREFIX.eigen3}/include/eigen3
CMAKE_ARGS+=	-DOPENRTM_DIR=${PREFIX.openrtm-aist}

USE_BOOST_LIBS=	filesystem signals system regex program_options

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/collada-dom/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/lapack/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk
include ../../middleware/openrtm-aist/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
