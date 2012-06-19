# robotpkg Makefile for:	image/visp
# Created:			Anthony Mallet on Tue, 9 Feb 2010
#
DISTNAME=		ViSP-${VERSION}
PKGNAME=		visp-${VERSION}
VERSION=		2.6.1

CATEGORIES=		image devel
MASTER_SITES=		https://gforge.inria.fr/frs/download.php/29283/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.irisa.fr/lagadic/visp/
COMMENT=		The Visual Servoing Platform
LICENSE=		qpl

USE_LANGUAGES+=		c c++
EG_DIR=			share/visp/examples
INSTALLATION_DIRS+=	${EG_DIR}

# Make sure to prepend source directory includes (otherwise visp uses installed
# headers)
CXXFLAGS+=	-I${WRKSRC}/include

# Configuration flags.
# See http://www.irisa.fr/lagadic/visp/librarieslist.html for details.
#

# Build shared libraries, enforce backward compatibility, don't build code
# coverage tests and enforce examples building. Require fairly common
# libraries.
CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=	-DBUILD_DEPRECATED=ON
CMAKE_ARGS+=	-DBUILD_TESTING=OFF
CMAKE_ARGS+=	-DBUILD_DEMOS=ON
CMAKE_ARGS+=	-DBUILD_EXAMPLES=ON
CMAKE_ARGS+=	-DUSE_XML2=ON
CMAKE_ARGS+=	-DUSE_LIBJPEG=ON
CMAKE_ARGS+=	-DUSE_LIBPNG=ON

# Compilation with ffmpeg fails (Note: not tested again with 2.6.1)
CMAKE_ARGS+=	-DUSE_FFMPEG=OFF

# User configurable options.
#
PKG_SUPPORTED_OPTIONS+=	gtk dc1394 opencv
PKG_SUGGESTED_OPTIONS+= opencv

PKG_OPTION_DESCR.dc1394?=	Enable image acquisition via libdc1394
PKG_OPTION_UNSET.dc1394:=	CMAKE_ARGS+=-DUSE_DC1394_2=OFF
define PKG_OPTION_SET.dc1394
  CMAKE_ARGS+=-DUSE_DC1394_2=ON
  include ../../image/libdc1394/depend.mk
endef

PKG_OPTION_DESCR.opencv?=	Enable the OpenCV interface
PKG_OPTION_UNSET.opencv:=	CMAKE_ARGS+=-DUSE_OPENCV=OFF
define PKG_OPTION_SET.opencv
  CMAKE_ARGS+=-DUSE_OPENCV=ON
  CMAKE_ARGS+=-DOpenCV_ROOT_DIR=${PREFIX.opencv}
endef

PKG_OPTION_DESCR.gtk?=		Enable gtk-based display
PKG_OPTION_UNSET.gtk:=		CMAKE_ARGS+=-DUSE_GTK2=OFF
define PKG_OPTION_SET.gtk
  CMAKE_ARGS+=-DUSE_GTK2=ON
  include ../../mk/sysdep/gtk.mk
endef

include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../image/opencv/depend.mk
include ../../math/blas/depend.mk
include ../../math/lapack/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/robotpkg.mk

# Install examples
#
post-install: visp-install-examples

.PHONY: visp-install-examples
visp-install-examples:
	@${STEP_MSG} "Installing example files"
	${RUN}cd ${WRKSRC} && cd example &&				\
	${FIND} . -name "*cpp" | while read f; do			\
		${TEST} -x $${f%.cpp} && ${ECHO} $${f%.cpp};		\
		${ECHO} $$f;						\
	done | ${PAX} -rw -pm ${PREFIX}/${EG_DIR}
