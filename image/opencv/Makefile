#
# Copyright (c) 2010 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                       Nizar Khalifa Sallem on Tue Apr 27 2010
#

PKGVERSION=		2.1.0
DISTNAME=		OpenCV-${PKGVERSION}
PKGNAME=		opencv-${PKGVERSION}
CATEGORIES=		image
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencv.willowgarage.com/wiki/
COMMENT=		Open Source Computer Vision
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=opencvlibrary/}
CONFLICTS+=		opencv1

USE_LANGUAGES+=		c c++ python
PYTHON_REQUIRED+=	>=2.6

# build configuration
CMAKE_ARGS+=		-DBUILD_PACKAGE=OFF
CMAKE_ARGS+=		-DBUILD_LATEX_DOCS=OFF
CMAKE_ARGS+=		-DBUILD_TESTS=OFF
CMAKE_ARGS+=		-DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=		-DBUILD_SWIG_PYTHON_SUPPORT=OFF
CMAKE_ARGS+=		-DOPENCV_BUILD_3RDPARTY_LIBS=OFF

# image format support
CMAKE_ARGS+=		-DWITH_JPEG=ON -DWITH_PNG=ON -DWITH_TIFF=ON

# disable those for now - they can be enabled later
CMAKE_ARGS+=		-DBUILD_OCTAVE_SUPPORT=OFF
CMAKE_ARGS+=		-DINSTALL_OCTAVE_EXAMPLES=OFF
CMAKE_ARGS+=		-DUSE_IPP=OFF
CMAKE_ARGS+=		-DWITH_FFMPEG=OFF
CMAKE_ARGS+=		-DWITH_GSTREAMER=OFF
CMAKE_ARGS+=		-DWITH_JASPER=OFF
CMAKE_ARGS+=		-DWITH_PVAPI=OFF
CMAKE_ARGS+=		-DWITH_TBB=OFF
CMAKE_ARGS+=		-DWITH_UNICAP=OFF
CMAKE_ARGS+=		-DWITH_V4L=OFF
CMAKE_ARGS+=		-DWITH_XINE=OFF


# option for building examples
PKG_SUPPORTED_OPTIONS+=		examples
PKG_OPTION_DESCR.examples= 	Builds and installs examples.
define PKG_OPTION_SET.examples
  CMAKE_ARGS+=			-DBUILD_EXAMPLES=ON
  CMAKE_ARGS+=			-DINSTALL_C_EXAMPLES=ON
  CMAKE_ARGS+=			-DINSTALL_PYTHON_EXAMPLES=ON
endef
define PKG_OPTION_UNSET.examples
  CMAKE_ARGS+=			-DBUILD_EXAMPLES=OFF
  CMAKE_ARGS+=			-DINSTALL_C_EXAMPLES=OFF
  CMAKE_ARGS+=			-DINSTALL_PYTHON_EXAMPLES=OFF
endef

# option for ieee1394 support
PKG_SUGGESTED_OPTIONS+=		ieee1394
PKG_SUPPORTED_OPTIONS+=		ieee1394
PKG_OPTION_DESCR.ieee1394=	Enable ieee1394 cameras support.
define PKG_OPTION_SET.ieee1394
  CMAKE_ARGS+=			-DWITH_1394=ON
  include ../../image/libdc1394/depend.mk
endef
define PKG_OPTION_UNSET.ieee1394
  CMAKE_ARGS+=			-DWITH_1394=OFF
endef

# option for gtk display
PKG_SUGGESTED_OPTIONS+=	gtk
PKG_SUPPORTED_OPTIONS+=	gtk
PKG_OPTION_DESCR.gtk=	Enable gtk+ 2.0 windows.
define PKG_OPTION_SET.gtk
  CMAKE_ARGS+=		-DWITH_GTK=ON
  include ../../mk/sysdep/gtk.mk
endef
define PKG_OPTION_UNSET.gtk
  CMAKE_ARGS+=		-DWITH_GTK=OFF
endef

include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libtiff.mk
include ../../archivers/bzip2/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
