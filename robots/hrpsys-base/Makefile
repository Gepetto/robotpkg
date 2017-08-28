# robotpkg Makefile for:	robots/hrpsys-base
# Created:			Anthony Mallet on Fri, 25 Aug 2017
#

VERSION=	315.14.0
DISTNAME=	hrpsys-base-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
MASTER_SITES=	${MASTER_SITE_GITHUB:=fkanehiro/hrpsys-base/archive/}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	robots
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://github.com/fkanehiro/hrpsys-base
COMMENT=	Basic OpenRTM Components and utilities to control robots
LICENSE=	eclipse

CMAKE_ARGS+=	-Wno-dev
CMAKE_ARGS+=	-DENABLE_INSTALL_RPATH=TRUE
CMAKE_ARGS+=	-DENABLE_DOXYGEN=FALSE

CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_PCL=TRUE
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_Irrlicht=TRUE
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_VTK=TRUE

CMAKE_ARGS+=	-DEIGEN_INCLUDE_DIR=${PREFIX.eigen3}/include/eigen3
CMAKE_ARGS+=	-DOPENRTM_DIR=${PREFIX.openrtm-aist}
CMAKE_ARGS+=	-DQHULL_DIR=${PREFIX.qhull}

INCLUDE_DIRS.qhull+=	$(dir $(filter %.h,${SYSTEM_FILES.qhull}))
LIBRARY_DIRS.qhull+=	$(dir $(filter %.so,${SYSTEM_FILES.qhull}))

USE_BOOST_LIBS=	python

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../image/opencv/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../middleware/openrtm-aist/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../simulation/openhrp3/depend.mk
include ../../mk/sysdep/SDL.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/glew.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qhull.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
