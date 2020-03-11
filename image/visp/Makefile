# robotpkg Makefile for:	image/visp
# Created:			Anthony Mallet on Tue, 9 Feb 2010
#
PKGREVISION=		2
VERSION=		3.3.0
DISTNAME=		visp-${VERSION}
CATEGORIES=		image

MAINTAINER=		visp@inria.fr
HOMEPAGE=		https://visp.inria.fr
COMMENT=		Visual Servoing Platform
MASTER_SITES=		https://gforge.inria.fr/frs/download.php/38283/
LICENSE=		gnu-gpl-v2

CONFIGURE_DIRS+=        build
CMAKE_ARG_PATH=         ${WRKSRC}

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR:PATH=lib

# external packages support
CMAKE_ARGS+=		-DBUILD_TESTS=OFF
CMAKE_ARGS+=		-DBUILD_DEMOS=OFF
CMAKE_ARGS+=		-DBUILD_EXAMPLES=OFF
CMAKE_ARGS+=		-DBUILD_TUTORIALS=OFF
CMAKE_ARGS+=		-DBUILD_JAVA=OFF
CMAKE_ARGS+=		-DEIGEN_INCLUDE_PATH=${PREFIX.eigen3}/include/eigen3

CMAKE_ARGS+=		-DUSE_OGRE=OFF
CMAKE_ARGS+=		-DUSE_DC1394=OFF
CMAKE_ARGS+=		-DUSE_LIBFREENECT=OFF
CMAKE_ARGS+=		-DUSE_YARP=OFF

# libpcl support
PKG_SUPPORTED_OPTIONS+=	libpcl
PKG_OPTION_DESCR.libpcl?=	Enable libpcl support
PKG_OPTION_UNSET.libpcl:=	CMAKE_ARGS+=-DUSE_PCL=OFF
define PKG_OPTION_SET.libpcl
  CMAKE_ARGS+=-DUSE_PCL=ON
  CMAKE_ARGS+=-DPCL_INCLUDE_DIRS=$(dir $(filter %.h,${SYSTEM_FILES.libpcl}))/..
  CMAKE_ARGS+=-DPCL_LIBRARY_DIRS=$(dir $(filter %.so,${SYSTEM_FILES.libpcl}))
  include ../../mk/sysdep/libpcl.mk
endef

include ../../archivers/zlib/depend.mk
include ../../image/opencv/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/lapack/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN} ${MKDIR} ${WRKSRC}/build
