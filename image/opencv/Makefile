# robotpkg Makefile for:	image/opencv
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

PKGREVISION=		2
VERSION=		2.4.1
DISTNAME=		OpenCV-${VERSION}
PKGNAME=		opencv-${VERSION}
CATEGORIES=		image
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencv.willowgarage.com/wiki/
COMMENT=		Open Source Computer Vision
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=opencvlibrary/}
CONFLICTS+=		opencv1
LICENSE=		modified-bsd

USE_LANGUAGES+=		c c++

# build configuration
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
CMAKE_ARGS+=	-DWITH_GTK=OFF -DWITH_QT=OFF
CMAKE_ARGS+=	-DWITH_IPP=OFF -DWITH_TBB=OFF
CMAKE_ARGS+=	-DWITH_OPENEXR=OFF -DWITH_PVAPI=OFF
CMAKE_ARGS+=	-DWITH_1394=OFF -DWITH_V4L=OFF
CMAKE_ARGS+=	-DWITH_JASPER=OFF -DWITH_JPEG=ON -DWITH_PNG=ON -DWITH_TIFF=ON
CMAKE_ARGS+=	-DWITH_CUBLAS=OFF -DWITH_CUDA=OFF -DWITH_CUFFT=OFF
CMAKE_ARGS+=	-DWITH_FFMPEG=ON -DWITH_OPENGL=OFF
CMAKE_ARGS+=	-DWITH_GSTREAMER=OFF -DWITH_XINE=OFF
CMAKE_ARGS+=	-DWITH_OPENNI=OFF
CMAKE_ARGS+=	-DWITH_EIGEN=ON
CMAKE_ARGS+=	-DWITH_UNICAP=OFF

# dependencies
CMAKE_ARGS+=	-DEIGEN_INCLUDE_PATH=${PREFIX.eigen2}/include/eigen2


# option for image acquistion support
include ../../mk/robotpkg.prefs.mk # OS_KERNEL
ifneq (,$(filter Darwin Linux,${OS_KERNEL}))
  PKG_SUGGESTED_OPTIONS+=	camera
  PKG_SUPPORTED_OPTIONS+=	camera
endif
PKG_OPTION_DESCR.camera=	Enable digital camera acquisition support
define PKG_OPTION_SET.camera
  CMAKE_ARGS+=			-DWITH_1394=ON -DWITH_V4L=ON
  include ../../image/libdc1394/depend.mk
endef

# option for display
PKG_SUGGESTED_OPTIONS+=		gtk
PKG_OPTIONS_OPTIONAL_GROUPS+=	display
PKG_OPTIONS_GROUP.display=	gtk qt
PKG_OPTION_DESCR.gtk=		Enable gtk+ 2.0 display
PKG_OPTION_DESCR.qt=		Enable Qt 4 display

define PKG_OPTION_SET.gtk
  CMAKE_ARGS+=			-DWITH_GTK=ON
  include ../../mk/sysdep/gtk.mk
endef
define PKG_OPTION_SET.qt
  CMAKE_ARGS+=			-DWITH_QT=ON
  include ../../mk/sysdep/mesa.mk
  include ../../mk/sysdep/qt4-libs.mk
endef

# option for doxygen documentation
PKG_SUGGESTED_OPTIONS+=		doc
PKG_SUPPORTED_OPTIONS+=		doc
PKG_OPTION_DESCR.doc=		Enable documentation generation
define PKG_OPTION_SET.doc
  CMAKE_ARGS+=			-DBUILD_DOCS=ON
  include ../../mk/sysdep/pdflatex.mk
  include ../../mk/sysdep/py-sphinx.mk
endef

include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../math/eigen2/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libavcodec.mk
include ../../mk/sysdep/libavformat.mk
include ../../mk/sysdep/libavutil.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libswscale.mk
include ../../mk/sysdep/libtiff.mk
include ../../mk/robotpkg.mk
