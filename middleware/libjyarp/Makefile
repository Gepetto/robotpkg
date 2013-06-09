# robotpkg Makefile for:	middleware/libjyarp
# Created:			Anthony Mallet on Tue, 27 Jan 2009
#

PKGVERSION=		2.3.20.1
DISTNAME=		yarp-${PKGVERSION_NOREV}
PKGNAME=		libjyarp-${PKGVERSION}
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Java bindings for YARP
LICENSE=		gnu-gpl-v2


CMAKE_ARGS+=		-DCREATE_JAVA=TRUE
CMAKE_ARGS+= 		-DCOMPILE_INPLACE=TRUE
CMAKE_ARGS+=		-DJAVA_INCLUDE_PATH=${JAVA_INCLUDE}
CMAKE_ARGS+=		-DJAVA_INCLUDE_PATH2=${JAVA_INCLUDE_MD}
CMAKE_ARGS+=		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE

CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DACE_INCLUDE_DIR=${PREFIX.ace}/include
CMAKE_ARGS+=		-DACE_LIBRARY=${PREFIX.ace}/lib/libACE.so

SWIG_DIR= 			${WRKSRC}/bindings
INSTALLATION_DIRS=	lib share/doc/libjyarp java/libjyarp/lib
CONFIGURE_DIRS=		${WRKSRC} ${SWIG_DIR}
BUILD_DIRS=			${SWIG_DIR}

DYNAMIC_PLIST_DIRS+=	share/doc/${PKGBASE}

# O1 is the highest possible optimization level: overwrite default -O3
_CFLAGS_NDEBUG:= -O1 -DNDEBUG

include ../../middleware/yarp/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../devel/swig/depend.mk
include ../../mk/language/java.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-configure:
	${RUN}								\
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_dev.so ${WRKSRC}/lib;	\
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_sig.so ${WRKSRC}/lib;	\
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_OS.so ${WRKSRC}/lib;	\
	${LN} -sf ${PREFIX.yarp}/lib/libYARP_init.so ${WRKSRC}/lib

post-build:
	${RUN}								\
	${MKDIR} ${SWIG_DIR}/build;					\
	${JAVAC} -d ${SWIG_DIR}/build ${SWIG_DIR}/generated_src/*.java;	\
	${JAR} cf ${SWIG_DIR}/libjyarp.jar -C ${SWIG_DIR}/build .;	\
	cd ${WRKDIR} && ${MKDIR} doc && cd doc &&			\
		${JAVADOC} ${SWIG_DIR}/generated_src/*.java

do-install:
	${RUN}								\
	${INSTALL_DATA}							\
		${SWIG_DIR}/libjyarp.jar			\
		${PREFIX}/java/libjyarp/lib;				\
	${INSTALL_LIB}							\
		${SWIG_DIR}/libjyarp.so			\
		${PREFIX}/lib;						\
	cd ${WRKDIR}/doc && ${PAX} -rwp ma . ${PREFIX}/share/doc/libjyarp
