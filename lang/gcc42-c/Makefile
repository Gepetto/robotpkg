# $LAAS: Makefile 2009/02/14 01:21:45 tho $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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

PKGNAME=		gcc42-c-${GCC_VERSION}
SUB_COMMENT=		C compiler

GCC_LANGUAGES=		c

GENERATE_PLIST+=						\
	${FIND} ${GCC_PREFIX} \( -type f -o -type l \) -print	\
		| ${SORT} | ${SED} -e "s,${PREFIX}/,,g";	\
	${FIND} ${GCC_PREFIX} -type d -mindepth 1 -print	\
		| ${SORT} -r | ${SED} -e "s,${PREFIX}/,@dirrm ,g";

INSTALL_TARGET=		install-gcc

# don't build a shared libgcc
CONFIGURE_ARGS+=        --disable-shared

include ../../lang/gcc42/Makefile.common
include ../../mk/robotpkg.mk
