# robotpkg Makefile for:	graphics/blender
# Created:			Séverin Lemaignan on Mon, 7 Dec 2009
#

PKGNAME=		blender-${PKGVERSION}
DISTNAME=		blender-${PKGVERSION_NOREV}
PKGVERSION=		2.64a

CATEGORIES=		graphics
MASTER_SITES=		http://download.blender.org/source/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.blender.org/
COMMENT=		Fully integrated 3D graphics creation suite
LICENSE=		gnu-gpl-v2

USE_LANGUAGES+=		c c++

CMAKE_ARG_PATH=		..
CONFIGURE_DIRS=		_build

# General configuration
CMAKE_ARGS+=		-DWITH_GAMEENGINE=ON	# GameEngine
CMAKE_ARGS+=		-DWITH_IK_ITASC=ON	# Inverse Kinematics
CMAKE_ARGS+=		-DWITH_OPENCOLLADA=OFF	# Collada (wait stabilization)
CMAKE_ARGS+=		-DWITH_PLAYER=ON	# Stand-alone Blender player
CMAKE_ARGS+=		-DWITH_SAMPLERATE=OFF	# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_JACK=OFF		# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_OPENAL=OFF	# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_SDL=OFF		# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_INSTALL_PORTABLE=OFF # Install in hier(8)
CMAKE_ARGS+=		-DWITH_CYCLES=OFF

# Enable embedded Python API, but don't copy system python into blender
CMAKE_ARGS+=		-DWITH_PYTHON=ON
CMAKE_ARGS+=		-DWITH_PYTHON_INSTALL=OFF
CMAKE_ARGS+=		-DPYTHON_INC=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIB=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_LIBPATH=$(dir ${PYTHON_LIB})

# Options

PKG_SUPPORTED_OPTIONS+=		ffmpeg
PKG_OPTION_DESCR.ffmpeg:=	Enable ffmpeg support
define PKG_OPTION_SET.ffmpeg
  CMAKE_ARGS+=		-DWITH_CODEC_FFMPEG=ON
  CMAKE_ARGS+=		-DFFMPEG=${PREFIX.libavcodec}
  include ../../mk/sysdep/libavformat.mk
  include ../../mk/sysdep/libavcodec.mk
  include ../../mk/sysdep/libavutil.mk
  include ../../mk/sysdep/libavdevice.mk
  include ../../mk/sysdep/libswscale.mk
endef
define PKG_OPTION_UNSET.ffmpeg
  CMAKE_ARGS+=		-DWITH_CODEC_FFMPEG=OFF
endef


DEPEND_ABI.python+=	python>=3.2<3.3
include ../../mk/sysdep/python.mk

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/freetype2.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libtiff.mk
include ../../mk/sysdep/glew.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/libXi.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build
