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
#                                          Severin Lemaignan on Mon Apr 29 2009
#

PKGVERSION=		2.2.6
DISTNAME=		yarp-${PKGVERSION}
PKGNAME=		libpyyarp-${PKGVERSION}
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}

CATEGORIES=		devel
MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Python bindings for YARP

USE_LANGUAGES+=		c c++

CMAKE_ARGS+=		-DCREATE_PYTHON=TRUE
CMAKE_ARGS+=		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE

CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DACE_INCLUDE_DIR=${PREFIX.ace}/include
CMAKE_ARGS+=		-DACE_LIBRARY=${PREFIX.ace}/lib/libACE.so

CONFIGURE_DIRS=		${WRKSRC} ${WRKSRC}/example/swig
BUILD_DIRS=		${WRKSRC}/example/swig

include ../../architecture/yarp/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/swig.mk
include ../../mk/robotpkg.mk

post-configure:
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_dev.so ${WRKSRC}/lib
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_sig.so ${WRKSRC}/lib
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_OS.so ${WRKSRC}/lib

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/${PYTHON_SITELIB}
	${INSTALL_DATA} ${WRKSRC}/example/swig/*.py		\
		${PREFIX}/${PYTHON_SITELIB}
	${INSTALL_LIB} ${WRKSRC}/example/swig/_yarp.so		\
		${PREFIX}/${PYTHON_SITELIB}
