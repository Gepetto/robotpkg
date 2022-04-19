# robotpkg Makefile for:	image/opencv4
# Created:			Guilhem Saurel on Tue,  8 Dec 2020
#

VERSION=		4.5.0
PKGNAME=		opencv4-${VERSION}
DISTNAME=		opencv-${VERSION}
DISTFILES=		${VERSION}${EXTRACT_SUFX}
DIST_SUBDIR=		opencv
CATEGORIES=		image

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencv.org/
COMMENT=		Open Source Computer Vision
MASTER_SITES=		${MASTER_SITE_GITHUB:=opencv/opencv/archive/}
CONFLICTS+=		opencv[1-3]-[0-9]*
LICENSE=		modified-bsd

CONFIGURE_DIRS+=	build
CMAKE_ARG_PATH=		${WRKSRC}

# external packages support
CMAKE_ARGS+=		-DWITH_1394=OFF
CMAKE_ARGS+=		-DWITH_JASPER=OFF
CMAKE_ARGS+=		-DWITH_OPENJPEG=OFF
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

CMAKE_ARGS+=		-DWITH_QT=OFF
CMAKE_ARGS+=		-DWITH_GTK=ON
CMAKE_ARGS+=		-DWITH_GTK_2_X=OFF
CMAKE_ARGS+=		-DZLIB_ROOT=${PREFIX.zlib}
CMAKE_ARGS+=		-DEIGEN_INCLUDE_PATH=${PREFIX.eigen3}/include/eigen3

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR:PATH=lib
CMAKE_ARGS+=		-DOPENCV_PYTHON_INSTALL_PATH=${PYTHON_SITELIB}

CMAKE_ARGS+=		-DBUILD_opencv_python2=OFF
CMAKE_ARGS+=		-DBUILD_opencv_python3=OFF
CMAKE_ARGS+=		-DBUILD_opencv_python${PYTHON_MAJOR}=ON

DEPEND_ABI.cmake+=	cmake>=3.5.1

include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/gtk3.mk
include ../../mk/sysdep/libavcodec.mk
include ../../mk/sysdep/libavformat.mk
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
