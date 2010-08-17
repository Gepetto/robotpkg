# robotpkg Makefile for:	lang/gcc42-fortran
# Created:			Anthony Mallet on Mon, 20 Oct 2008
#

PKGNAME=		gcc42-fortran-${GCC_VERSION}
SUB_COMMENT=		fortran compiler
DISTFILES+=		gcc-fortran-${GCC_VERSION}${EXTRACT_SUFX}

GCC_LANGUAGES=		fortran

include ../../lang/gcc42/Makefile.common

BUILD_TARGET+=		all-target-libgfortran

CONFIGURE_ARGS+=        --with-gmp=${PREFIX.gmp}
CONFIGURE_ARGS+=        --with-mpfr=${PREFIX.mpfr}
CONFIGURE_ARGS+=        --enable-shared=libgfortran

# make sure gfortran has the run-time path for gmp libs
CONFIGURE_ARGS+=\
	--with-mpfr-lib="${PREFIX.mpfr}/lib ${COMPILER_RPATH_FLAG}${PREFIX.mpfr}/lib"
CONFIGURE_ARGS+=\
	--with-gmp-lib="${PREFIX.gmp}/lib ${COMPILER_RPATH_FLAG}${PREFIX.gmp}/lib"

include ../../lang/gcc42-c/depend.mk
include ../../math/gmp/depend.mk
include ../../math/mpfr/depend.mk
include ../../mk/robotpkg.mk

# some magic stuff to install only what's needed
do-install:
	${RUN}cd ${WRKDIR}/build/gcc && ${INSTALL_LOGFILTER}		\
		${SETENV} ${MAKE_ENV} ${MAKE} 				\
                lang.install-common lang.install-info lang.install-man
	${RUN}${INSTALL_LOGFILTER} $(INSTALL_PROGRAM)			\
		${WRKDIR}/build/gcc/f951 				\
		${GCC_PREFIX}/libexec/gcc/${GNU_CONFIGURE_HOST}/${GCC_VERSION}
	${RUN}cd ${WRKDIR}/build && ${INSTALL_LOGFILTER}		\
		${SETENV} ${MAKE_ENV} ${MAKE}				\
                install-target-libgfortran
