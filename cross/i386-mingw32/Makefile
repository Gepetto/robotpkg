# robotpkg Makefile for:	lang/cross-i386-mingw32
# Created:			Anthony Mallet on Wed, 2 Jul 2008
#

PREFIX=			${LOCALBASE}/cross
TARGET_ARCH=		i386-mingw32
TARGET_DIR=		${PREFIX}/${TARGET_ARCH}

DISTNAME=		cross-${TARGET_ARCH}-3.14
MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.mingw.org/
COMMENT=		Cross-compile environment for MinGW
CATEGORIES=		lang

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=mingw/}
DISTFILES=		binutils-2.18.50-20080109-2-src.tar.gz	\
			gcc-core-3.4.5-20060117-2-src.tar.gz 	\
			gcc-g++-3.4.5-20060117-2-src.tar.gz	\
			mingw-runtime-3.14.tar.gz		\
			w32api-3.11.tar.gz			\

include ../../mk/robotpkg.prefs.mk

WRKSRC=			${WRKDIR}# for the patch target
BINUTILS_WRKSRC=	${WRKDIR}/binutils-2.18.50
GCC_WRKSRC=		${WRKDIR}/gcc-3.4.5-20060117-2

AS_FOR_TARGET=		${BINUTILS_WRKSRC}/gas/as-new
AR_FOR_TARGET=		${BINUTILS_WRKSRC}/binutils/ar
NM_FOR_TARGET=		${BINUTILS_WRKSRC}/binutils/nm-new
RANLIB_FOR_TARGET=	${BINUTILS_WRKSRC}/binutils/ranlib
LD_FOR_TARGET=		${BINUTILS_WRKSRC}/ld/ld-new
CC_FOR_TARGET=		${GCC_WRKSRC}/gcc/xgcc		\
		-B${GCC_WRKSRC}/gcc/ -B${WRKSRC}/lib	\
		-I${WRKSRC}/include -L${WRKSRC}/lib
CXX_FOR_TARGET=		${CC_FOR_TARGET}


GCC_VERSION=		3.4.5

GNU_CONFIGURE=		yes
CONFIGURE_DIRS=		${BINUTILS_WRKSRC}
CONFIGURE_DIRS+=	${GCC_WRKSRC}
CONFIGURE_ARGS+=	--prefix=${PREFIX} --target=${TARGET_ARCH}
CONFIGURE_ARGS+=	--enable-languages="c,c++" --with-gnu-as --with-gnu-ld
CONFIGURE_ARGS+=	--disable-multilib --disable-nls --enable-sjlj-exceptions
CONFIGURE_ARGS+=	--with-gxx-include-dir=${TARGET_DIR}/include/c++/${GCC_VERSION}


BUILD_TARGET.${GCC_WRKSRC}=	all-gcc all-target-libstdc++-v3
BUILD_MAKE_FLAGS=\
	AS_FOR_TARGET=$(call quote,${AS_FOR_TARGET})			\
	LD_FOR_TARGET=$(call quote,${LD_FOR_TARGET})			\
	CC_FOR_TARGET=$(call quote,${CC_FOR_TARGET})			\
	GCC_FOR_TARGET=$(call quote,${CC_FOR_TARGET})			\
	CXX_FOR_TARGET=$(call quote,${CXX_FOR_TARGET})			\
	RAW_CXX_FOR_TARGET=$(call quote,${CXX_FOR_TARGET})		\
	AR_FOR_TARGET=$(call quote,${AR_FOR_TARGET})			\
	RANLIB_FOR_TARGET=$(call quote,${RANLIB_FOR_TARGET})		\
	NM_FOR_TARGET=$(call quote,${NM_FOR_TARGET})			\
	gcc_cv_as_hidden=no

#	INSTALL="${INSTALL} -c -o ${BINOWN} -g ${BINGRP}"		\
#	INSTALL_PROGRAM=$(call quote,${INSTALL_PROGRAM})		\

BINUTILS_EXTRAS=	dlltool dllwrap windres

PLIST_SUBST+=		GCC_VERSION=${GCC_VERSION:Q}

MINGW_WRKSRC=		${WRKDIR}/mingw-runtime-3.2

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

pre-build:
	@${MKDIR} -p ${GCC_WRKSRC}/${TARGET_ARCH}
	@${LN} -sf ${AS_FOR_TARGET} ${GCC_WRKSRC}/gcc/as
	@${LN} -sf ${LD_FOR_TARGET} ${GCC_WRKSRC}/gcc/ld
	@${LN} -sf ${GCC_WRKSRC}/include ${GCC_WRKSRC}/${TARGET_ARCH}

do-install: bu-install gcc-install mingw-install
	@:

bu-install:
	${INSTALL_PROGRAM_DIR} ${TARGET_DIR}/bin
	${INSTALL_PROGRAM_DIR} ${PREFIX}/bin
	${INSTALL_PROGRAM} ${BINUTILS_WRKSRC}/gas/as-new ${TARGET_DIR}/bin/as
	${INSTALL_PROGRAM} ${BINUTILS_WRKSRC}/ld/ld-new ${TARGET_DIR}/bin/ld
	${INSTALL_PROGRAM} ${BINUTILS_WRKSRC}/binutils/nm-new ${TARGET_DIR}/bin/nm
	${INSTALL_PROGRAM} ${BINUTILS_WRKSRC}/binutils/strip-new ${TARGET_DIR}/bin/strip
	for i in addr2line ar objcopy objdump ranlib size strings ${BINUTILS_EXTRAS}; do \
		${INSTALL_PROGRAM} ${BINUTILS_WRKSRC}/binutils/$$i ${TARGET_DIR}/bin/$$i; \
	done
	for i in addr2line ar as ld nm objcopy objdump ranlib size strings strip \
	${BINUTILS_EXTRAS}; do \
		${LN} -f ${TARGET_DIR}/bin/$$i ${PREFIX}/bin/${TARGET_ARCH}-$$i; \
	done

gcc-install:
	@cd ${GCC_WRKSRC}/gcc && ${SETENV} ${MAKE_ENV} \
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${BUILD_MAKE_FLAGS} \
		install-common install-headers install-libgcc install-driver
	for file in c++ g++; do \
		${LN} -f ${PREFIX}/bin/${TARGET_ARCH}-$$file ${TARGET_DIR}/bin/$$file; \
	done
	@cd ${GCC_WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${BUILD_MAKE_FLAGS} \
		install-target-libstdc++-v3

mingw-install:
	${INSTALL_DATA_DIR} ${TARGET_DIR}/include
	cd ${WRKSRC}/include && ${TAR} cf - * | ${TAR} xf - -C ${TARGET_DIR}/include
	${CHMOD} go-wx `${FIND} ${TARGET_DIR}/include -type f`
	${CHMOD} go-w `${FIND} ${TARGET_DIR}/include -type d`
	${INSTALL_DATA_DIR} ${TARGET_DIR}/lib
	-rm -r ${WRKSRC}/lib/gcc-lib
	${INSTALL_DATA} ${WRKSRC}/lib/* ${TARGET_DIR}/lib
	${INSTALL_DATA} ${WRKSRC}/bin/mingwm10.dll ${TARGET_DIR}/lib
