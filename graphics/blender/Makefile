# $LAAS: Makefile 2009/06/11 22:46:57 tho $
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                           Séverin Lemaignan on Mon Dec 7 2009
#

DISTNAME=		blender-2.50-alpha0

CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=blender/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.blender.org/
COMMENT=		Blender is an open source 3D content creation suite

CMAKE_ARG_PATH=		..
CONFIGURE_DIRS=		_build

USE_LANGUAGES+=		c c++

PYTHON_REQD=		3.1

CMAKE_ARGS+=		-DWITH_PLAYER=OFF
CMAKE_ARGS+=		-DWITH_ELBEEM=ON #Internal fluid simulation
CMAKE_ARGS+=		-DWITH_OPENEXR=OFF
CMAKE_ARGS+=		-DWITH_DDS=OFF #DirectDraw Surface textures plugin
CMAKE_ARGS+=		-DWITH_FFMPEG=OFF
CMAKE_ARGS+=		-DWITH_OPENAL=OFF
CMAKE_ARGS+=		-DWITH_WEBPLUGIN=OFF
CMAKE_ARGS+=		-DWITH_SDL=OFF
CMAKE_ARGS+=		-DWITH_JACK=OFF
CMAKE_ARGS+=		-DWITH_SNDFILE=OFF
CMAKE_ARGS+=		-DWITH_JACK=OFF
CMAKE_ARGS+=		-DWITH_OPENCOLLADA=OFF
CMAKE_ARGS+=		-DWITH_OPENMP=ON

include ../../lang/python3/depend.mk

CMAKE_ARGS+=		-DPYTHON_INC=${PREFIX}/include/python${PYTHON_REQD}
CMAKE_ARGS+=		-DPYTHON_LIBPATH=${PREFIX}/lib

pre-configure:
	${MKDIR} ${WRKSRC}/_build

include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
