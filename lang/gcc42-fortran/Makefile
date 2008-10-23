# $LAAS: Makefile 2008/10/23 00:11:19 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Thu Feb 28 2008
#

PKGNAME=		gcc42-fortran-${GCC_VERSION}
SUB_COMMENT=		fortran compiler
DISTFILES+=		gcc-fortran-${GCC_VERSION}${EXTRACT_SUFX}

GCC_LANGUAGES=		fortran

include ../../lang/gcc42/Makefile.common

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
