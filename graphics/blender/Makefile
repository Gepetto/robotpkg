# robotpkg Makefile for:	graphics/blender
# Created:			Séverin Lemaignan on Mon, 7 Dec 2009
#

PKGNAME=		blender-${PKGVERSION}
DISTNAME=		blender-${PKGVERSION_NOREV}
PKGVERSION=		2.59

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
CMAKE_ARGS+=		-DWITH_OPENCOLLADA=OFF	# Collada (wait for stabilization)
CMAKE_ARGS+=		-DWITH_PLAYER=ON	# Stand-alone Blender player
CMAKE_ARGS+=		-DWITH_SAMPLERATE=OFF	# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_JACK=OFF		# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_OPENAL=OFF	# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_SDL=OFF		# Fix bug with audaspace
CMAKE_ARGS+=		-DWITH_INSTALL_PORTABLE=OFF # Install in hier(8)

# Workaroud against a gcc bug (or a faulty C file :) when building
# view3d_select.c with -O3 (in particulary -finline-functions) and
# -fno-strict-aliasing
_CFLAGS_NDEBUG=-O2 -DNDEBUG

# Embed Python runtime in the binary
CMAKE_ARGS+=		-DWITH_PYTHON=ON
CMAKE_ARGS+=		-DWITH_PYTHON_INSTALL=ON
CMAKE_ARGS+=		-DPYTHON_INC=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIB=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_LIBPATH=$(dir ${PYTHON_LIB})

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

DEPEND_ABI.python+=	python>=3.2<3.3
include ../../mk/sysdep/python.mk

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/freetype2.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libtiff.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/libXi.mk
include ../../mk/robotpkg.mk

post-install: python-compile-all(${PREFIX}/share/blender/${PKGVERSION}/python/lib/python${PYTHON_VERSION}) \
	python-compile-all(${PREFIX}/share/blender/${PKGVERSION}/scripts)
