# robotpkg Makefile for:	image/opencv3
# Created:			Anthony Mallet on Wed, 12 Sep 2018
#

VERSION=		3.4.3
PKGNAME=		opencv3-${VERSION}
DISTNAME=		opencv-${VERSION}
DISTFILES=		${VERSION}${EXTRACT_SUFX}
DIST_SUBDIR=		opencv
CATEGORIES=		image

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencv.org/
COMMENT=		Open Source Computer Vision
MASTER_SITES=		${MASTER_SITE_GITHUB:=opencv/opencv/archive/}
CONFLICTS+=		opencv-[0-9]*
CONFLICTS+=		opencv[1-2]-[0-9]*
LICENSE=		modified-bsd

CONFIGURE_DIRS+=        build
CMAKE_ARG_PATH=         ${WRKSRC}

# external packages support
CMAKE_ARGS+=		-DWITH_1394=OFF
CMAKE_ARGS+=		-DWITH_JASPER=OFF
CMAKE_ARGS+=		-DWITH_LAPACK=OFF
CMAKE_ARGS+=		-DWITH_MATLAB=OFF
CMAKE_ARGS+=		-DWITH_OPENCL=OFF
CMAKE_ARGS+=		-DWITH_OPENEXR=OFF
CMAKE_ARGS+=		-DWITH_PROTOBUF=OFF
CMAKE_ARGS+=		-DWITH_WEBP=OFF
CMAKE_ARGS+=		-DWITH_VTK=OFF
CMAKE_ARGS+=		-DENABLE_CCACHE=OFF
CMAKE_ARGS+=		-DENABLE_PRECOMPILED_HEADERS=OFF
CMAKE_ARGS+=		-DCV_TRACE=OFF

CMAKE_ARGS+=		-DZLIB_ROOT=${PREFIX.zlib}
CMAKE_ARGS+=		-DEIGEN_INCLUDE_PATH=${PREFIX.eigen3}/include/eigen3

CMAKE_ARGS+=            -DCMAKE_INSTALL_LIBDIR:PATH=lib

CMAKE_ARGS+=            -DPYTHON_EXECUTABLE:FILEPATH=${PYTHON}
CMAKE_ARGS+=            -DPYTHON2_PACKAGES_PATH:FILEPATH=${PYTHON_SITELIB}
CMAKE_ARGS+=            -DPYTHON3_PACKAGES_PATH:FILEPATH=${PYTHON_SITELIB}

include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/gtk.mk
include ../../mk/sysdep/libavcodec.mk
include ../../mk/sysdep/libavformat.mk
include ../../mk/sysdep/libavresample.mk
include ../../mk/sysdep/libavutil.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libswscale.mk
include ../../mk/sysdep/libtiff.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN} ${MKDIR} ${WRKSRC}/build
