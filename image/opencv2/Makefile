# robotpkg Makefile for:	image/opencv2
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

VERSION=		2.4.13.6
PKGNAME=		opencv2-${VERSION}
DISTNAME=		opencv-${VERSION}
DISTFILES=		${VERSION}${EXTRACT_SUFX}
DIST_SUBDIR=		opencv
CATEGORIES=		image

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencv.org/
COMMENT=		Open Source Computer Vision
MASTER_SITES=		${MASTER_SITE_GITHUB:=opencv/opencv/archive/}
CONFLICTS+=		opencv-[0-9]*
CONFLICTS+=		opencv1-[0-9]*
CONFLICTS+=		opencv3-[0-9]*
LICENSE=		modified-bsd

CONFIGURE_DIRS+=        build
CMAKE_ARG_PATH=         ${WRKSRC}

# build configuration
CMAKE_ARGS+=	-Wno-dev
CMAKE_ARGS+=	-DENABLE_PRECOMPILED_HEADERS=OFF
CMAKE_ARGS+=	-DENABLE_CCACHE=OFF
CMAKE_ARGS+=	-DBUILD_PACKAGE=OFF -DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=	-DBUILD_TESTS=ON -DBUILD_PERF_TESTS=OFF
CMAKE_ARGS+=	-DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF
CMAKE_ARGS+=	-DBUILD_JASPER=OFF -DBUILD_JPEG=OFF
CMAKE_ARGS+=	-DBUILD_TIFF=OFF -DBUILD_PNG=OFF
CMAKE_ARGS+=	-DBUILD_ZLIB=OFF
CMAKE_ARGS+=	-DBUILD_opencv_calib3d=ON
CMAKE_ARGS+=	-DBUILD_opencv_contrib=ON
CMAKE_ARGS+=	-DBUILD_opencv_core=ON
CMAKE_ARGS+=	-DBUILD_opencv_features2d=ON
CMAKE_ARGS+=	-DBUILD_opencv_flann=ON
CMAKE_ARGS+=	-DBUILD_opencv_gpu=OFF
CMAKE_ARGS+=	-DBUILD_opencv_highgui=ON
CMAKE_ARGS+=	-DBUILD_opencv_imgproc=ON
CMAKE_ARGS+=	-DBUILD_opencv_legacy=ON
CMAKE_ARGS+=	-DBUILD_opencv_ml=ON
CMAKE_ARGS+=	-DBUILD_opencv_nonfree=OFF
CMAKE_ARGS+=	-DBUILD_opencv_objdetect=ON
CMAKE_ARGS+=	-DBUILD_opencv_photo=ON
CMAKE_ARGS+=	-DBUILD_opencv_python=OFF
CMAKE_ARGS+=	-DBUILD_opencv_stitching=ON
CMAKE_ARGS+=	-DBUILD_opencv_ts=ON
CMAKE_ARGS+=	-DBUILD_opencv_video=ON
CMAKE_ARGS+=	-DBUILD_opencv_videostab=ON

# external packages support
CMAKE_ARGS+=	-DWITH_GTK=ON -DWITH_QT=OFF
CMAKE_ARGS+=	-DWITH_IPP=OFF -DWITH_TBB=OFF
CMAKE_ARGS+=	-DWITH_OPENEXR=OFF -DWITH_PVAPI=OFF
CMAKE_ARGS+=	-DWITH_1394=OFF
CMAKE_ARGS+=	-DWITH_JASPER=OFF -DWITH_JPEG=ON -DWITH_PNG=ON -DWITH_TIFF=ON
CMAKE_ARGS+=	-DWITH_CUBLAS=OFF -DWITH_CUDA=OFF -DWITH_CUFFT=OFF
CMAKE_ARGS+=	-DWITH_FFMPEG=ON -DWITH_OPENGL=OFF
CMAKE_ARGS+=	-DWITH_GSTREAMER=OFF -DWITH_XINE=OFF
CMAKE_ARGS+=	-DWITH_OPENNI=OFF
CMAKE_ARGS+=	-DWITH_EIGEN=ON
CMAKE_ARGS+=	-DWITH_UNICAP=OFF
CMAKE_ARGS+=	-DWITH_OPENCL=OFF
CMAKE_ARGS+=	-DWITH_V4L=$(if $(filter Linux,${OS_KERNEL}),ON,OFF)

# dependencies
CMAKE_ARGS+=	-DEIGEN_INCLUDE_PATH=${PREFIX.eigen3}/include/eigen3

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
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN} ${MKDIR} ${WRKSRC}/build
