# $LAAS: Makefile 2009/01/27 19:11:09 mallet $
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
#                                             Anthony Mallet on Thu Jan 27 2009
#

PKGVERSION=		2.2.2
DISTNAME=		yarp-${PKGVERSION}
PKGNAME=		libjyarp-${PKGVERSION}
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Java bindings for YARP

CMAKE_ARGS+=		-DCREATE_JAVA=TRUE
CMAKE_ARGS+=		-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include
CMAKE_ARGS+=		-DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux
CMAKE_ARGS+=		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE

CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DACE_INCLUDE_DIR=${PREFIX.ace}/include
CMAKE_ARGS+=		-DACE_LIBRARY=${PREFIX.ace}/lib/libACE.so

CONFIGURE_DIRS=		${WRKSRC} ${WRKSRC}/example/swig
BUILD_DIRS=		${WRKSRC}/example/swig

include ../../architecture/yarp/depend.mk
include ../../lang/sun-jdk6/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk

post-configure:
	${LN} -s ${PREFIX.yarp}/lib/libYARP_dev.so ${WRKSRC}/lib
	${LN} -s ${PREFIX.yarp}/lib/libYARP_sig.so ${WRKSRC}/lib
	${LN} -s ${PREFIX.yarp}/lib/libYARP_OS.so ${WRKSRC}/lib

post-build:
	${JAVA_HOME}/bin/jar cf 				\
		${WRKSRC}/example/swig/libjyarp.jar		\
		${WRKSRC}/example/swig/*.java
	cd ${WRKDIR} && ${MKDIR} doc && cd doc &&		\
	${JAVA_HOME}/bin/javadoc ${WRKSRC}/example/swig/*.java

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/java/libjyarp/lib
	${INSTALL_LIB_DIR} ${PREFIX}/lib
	${INSTALL_DATA}						\
		${WRKSRC}/example/swig/libjyarp.jar		\
		${PREFIX}/java/libjyarp/lib
	${INSTALL_LIB}						\
		${WRKSRC}/example/swig/libjyarp.so		\
		${PREFIX}/lib
	cd ${WRKDIR}/doc && ${PAX} -rwp ma . ${PREFIX}/share/doc/libjyarp
