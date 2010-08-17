# robotpkg Makefile for:	lang/gcc42-c++
# Created:			Anthony Mallet on Mon, 20 Oct 2008
#

PKGNAME=		gcc42-c++-${GCC_VERSION}
SUB_COMMENT=		C++ compiler
DISTFILES+=		gcc-g++-${GCC_VERSION}${EXTRACT_SUFX}

GCC_LANGUAGES=		c++

include ../../lang/gcc42/Makefile.common

BUILD_TARGET+=		all-target-libstdc++-v3
BUILD_MAKE_FLAGS+=	gcc_cv_getipinfo=no

CONFIGURE_ARGS+=        --enable-shared=libstdc++

include ../../lang/gcc42-c/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${RUN}cd ${WRKDIR}/build/gcc && ${INSTALL_LOGFILTER}		\
		${SETENV} ${MAKE_ENV} ${MAKE} 				\
                lang.install-common lang.install-info lang.install-man
	${RUN}cd ${WRKDIR}/build && ${INSTALL_LOGFILTER}		\
		${SETENV} ${MAKE_ENV} ${MAKE}				\
                install-target-libstdc++-v3
	${RUN}${INSTALL_LOGFILTER} $(INSTALL_PROGRAM)			\
		${WRKDIR}/build/gcc/cc1plus 				\
		${GCC_PREFIX}/libexec/gcc/${GNU_CONFIGURE_HOST}/${GCC_VERSION}
