# robotpkg Makefile for:	middleware/libjyarp
# Created:			Anthony Mallet on Tue, 27 Jan 2009
#

PKGVERSION=		2.3.1
DISTNAME=		yarp-${PKGVERSION}
PKGNAME=		libjyarp-${PKGVERSION}
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Java bindings for YARP
LICENSE=		gnu-gpl-v2

USE_LANGUAGES+=		c c++

CMAKE_ARGS+=		-DCREATE_JAVA=TRUE
CMAKE_ARGS+=		-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include
CMAKE_ARGS+=		-DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux
CMAKE_ARGS+=		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE

CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DACE_INCLUDE_DIR=${PREFIX.ace}/include
CMAKE_ARGS+=		-DACE_LIBRARY=${PREFIX.ace}/lib/libACE.so

CONFIGURE_DIRS=		${WRKSRC} ${WRKSRC}/example/swig
BUILD_DIRS=		${WRKSRC}/example/swig

# O1 is the highest possible optimization level: overwrite default -O3
_CFLAGS_NDEBUG:= -O1 -DNDEBUG

include ../../middleware/yarp/depend.mk
include ../../lang/sun-jdk6/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/swig.mk
include ../../mk/robotpkg.mk

post-configure:
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_dev.so ${WRKSRC}/lib
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_sig.so ${WRKSRC}/lib
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_OS.so ${WRKSRC}/lib
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_init.so ${WRKSRC}/lib

post-build:
	${MKDIR} ${WRKSRC}/example/swig/build
	${JAVA_HOME}/bin/javac -d ${WRKSRC}/example/swig/build	\
		${WRKSRC}/example/swig/generated_src/*.java
	${JAVA_HOME}/bin/jar cf 				\
		${WRKSRC}/example/swig/libjyarp.jar		\
		-C ${WRKSRC}/example/swig/build			\
		.
	cd ${WRKDIR} && ${MKDIR} doc && cd doc &&		\
	${JAVA_HOME}/bin/javadoc				\
		${WRKSRC}/example/swig/generated_src/*.java

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
