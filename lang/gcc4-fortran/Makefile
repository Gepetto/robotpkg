# $Id: Makefile 356f8ccc80eca1a280ee33c4cc2def68 2008/02/17 16:11:57 tho $

PKGNAME=		gcc4-fortran-${GCC_VERSION}
SUB_COMMENT=		fortran compiler
DISTFILES+=		gcc-fortran-${GCC_VERSION}${EXTRACT_SUFX}

GCC_LANGUAGES=		fortran

include ../../lang/gcc4/Makefile.common

CONFIGURE_ARGS+=        --with-gmp=${PREFIX.gmp}
CONFIGURE_ARGS+=        --with-mpfr=${PREFIX.mpfr}

BUILD_TARGET+=		all-target-libgfortran

# make sure gfortran has the run-time path for gmp libs
HOST_GMPLIBS=		${DEPEND_LDFLAGS} ${DEPEND_LIBS}
BUILD_TARGET+=		HOST_GMPLIBS=$(call quote,${HOST_GMPLIBS})

include ../../math/gmp/depend.mk
include ../../math/mpfr/depend.mk
include ../../mk/robotpkg.mk

# some magic stuff to install only what's needed
do-install:
	cd ${WRKDIR}/build/gcc && ${SETENV} ${MAKE_ENV} ${MAKE} 	\
                lang.install-common lang.install-info lang.install-man
	$(INSTALL_PROGRAM) ${WRKDIR}/build/gcc/f951 			\
		${GCC_PREFIX}/libexec/gcc/${GNU_CONFIGURE_HOST}/${GCC_VERSION}
	cd ${WRKDIR}/build && ${SETENV} ${MAKE_ENV} ${MAKE}		\
                install-target-libgfortran
