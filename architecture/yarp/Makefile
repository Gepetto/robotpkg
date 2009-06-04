# $LAAS: Makefile 2009/01/27 17:07:57 mallet $
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
#                                      Anthony Mallet on Thu Jan 22 2009
#

DISTNAME=		yarp-2.2.3
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Yet Another Robot Platform

USE_LANGUAGES+=		c++

CMAKE_ARGS+=		-DACE_INCLUDE_DIR=${PREFIX.ace}/include
CMAKE_ARGS+=		-DACE_LIBRARY=${PREFIX.ace}/lib/libACE.so
CMAKE_ARGS+=		-DACE_LINK_FLAGS=-L${PREFIX.ace}/lib
CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE

# XXX needs something more generic
CXXFLAGS+=		-pthread

include ../../architecture/ace/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
