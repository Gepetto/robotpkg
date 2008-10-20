# $LAAS: Makefile 2008/10/17 22:43:17 tho $
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
#                                      Anthony Mallet on Fri Oct 17 2008
#

PKGNAME=		gcc4-c++-${GCC_VERSION}
SUB_COMMENT=		C++ compiler
DISTFILES+=		gcc-g++-${GCC_VERSION}${EXTRACT_SUFX}

GCC_LANGUAGES=		c++

include ../../lang/gcc4/Makefile.common

BUILD_TARGET+=		all-target-libstdc++-v3
BUILD_MAKE_FLAGS+=	gcc_cv_getipinfo=no

include ../../lang/gcc4-c/depend.mk
include ../../mk/robotpkg.mk

do-install:
	cd ${WRKDIR}/build/gcc && ${SETENV} ${MAKE_ENV} ${MAKE} 	\
                lang.install-common lang.install-info lang.install-man
	cd ${WRKDIR}/build && ${SETENV} ${MAKE_ENV} ${MAKE}		\
                install-target-libstdc++-v3
	$(INSTALL_PROGRAM) ${WRKDIR}/build/gcc/cc1plus 			\
		${GCC_PREFIX}/libexec/gcc/${GNU_CONFIGURE_HOST}/${GCC_VERSION}
