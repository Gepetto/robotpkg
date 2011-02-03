# robotpkg Makefile for:	image/opencv
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

VERSION=		2.2.0
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
NOT_FOR_PLATFORM=

USE_LANGUAGES+=		c c++

# build configuration
CMAKE_ARGS+=		-DUSE_IPP=OFF
CMAKE_ARGS+=		-DUSE_O3=OFF
CMAKE_ARGS+=		-DBUILD_DOXYGEN_DOCS=OFF
CMAKE_ARGS+=		-DBUILD_EXAMPLES=OFF
CMAKE_ARGS+=		-DBUILD_LATEX_DOCS=OFF
CMAKE_ARGS+=		-DBUILD_NEW_PYTHON_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_PACKAGE=OFF
CMAKE_ARGS+=		-DBUILD_TESTS=OFF
CMAKE_ARGS+=		-DINSTALL_PYTHON_EXAMPLES=OFF

CMAKE_ARGS+=		-DINSTALL_C_EXAMPLES=ON
CMAKE_ARGS+=		-DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=		-DEIGEN2_INCLUDE_PATH=${PREFIX.eigen2}/include/eigen2

# external packages support
CMAKE_ARGS+=		-DWITH_GTK=OFF -DWITH_QT=OFF -DWITH_QT_OPENGL=OFF
CMAKE_ARGS+=		-DWITH_1394=OFF -DWITH_V4L=OFF
CMAKE_ARGS+=		-DWITH_EIGEN2=ON
CMAKE_ARGS+=		-DWITH_JPEG=ON -DWITH_PNG=ON -DWITH_TIFF=ON

# disable those for now - they can be enabled later
CMAKE_ARGS+=		-DWITH_CUDA=OFF
CMAKE_ARGS+=		-DWITH_FFMPEG=OFF
CMAKE_ARGS+=		-DWITH_GSTREAMER=OFF
CMAKE_ARGS+=		-DWITH_JASPER=OFF
CMAKE_ARGS+=		-DWITH_PVAPI=OFF
CMAKE_ARGS+=		-DWITH_TBB=OFF
CMAKE_ARGS+=		-DWITH_UNICAP=OFF
CMAKE_ARGS+=		-DWITH_XINE=OFF


# option for image acquistion support
PKG_SUGGESTED_OPTIONS+=		camera
PKG_SUPPORTED_OPTIONS+=		camera
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
  CMAKE_ARGS+=			-DWITH_QT=ON -DWITH_QT_OPENGL=ON
  include ../../mk/sysdep/mesa.mk
  include ../../mk/sysdep/qt4-libs.mk
endef

# option for doxygen documentation
PKG_SUGGESTED_OPTIONS+=		doc
PKG_SUPPORTED_OPTIONS+=		doc
PKG_OPTION_DESCR.doc=		Enable doxygen documentation generation
define PKG_OPTION_SET.doc
  CMAKE_ARGS+=			-DBUILD_DOXYGEN_DOCS=ON
  DOXYGEN_PLIST_DIR+=		share/opencv/doc/html
  include ../../mk/sysdep/doxygen.mk
endef

include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libtiff.mk
include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../math/eigen2/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk

# Backward compatibility with OpenCV 2.1
post-install:
	${RUN}cd ${PREFIX}/include/opencv &&		\
	${LN} -s ../opencv2/core/types_c.h cxtypes.h
