# $LAAS: depend.mk 2009/02/15 21:08:04 tho $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice and  this list of  conditions  in the  documentation and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Sat Apr 19 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ZLIB_DEPEND_MK:=	${ZLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		zlib
endif

ifeq (+,$(ZLIB_DEPEND_MK)) # -----------------------------------------

PREFER.zlib?=		system

DEPEND_ABI.zlib?=	zlib>=1.2.3
DEPEND_DIR.zlib?=	../../archivers/zlib

DEPEND_LIBS.zlib+=	-lz

SYSTEM_SEARCH.zlib=	\
	include/zlib.h	\
	include/zconf.h	\
	lib/libz.*

  # pull-in the user preferences for zlib now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(ZLIB_STYLE)+$(PREFER.zlib)))
  # This is the "inplace" version of zlib package, for bootstrap process
  #
ZLIB_FILESDIR=	${ROBOTPKG_DIR}/archivers/zlib/dist
ZLIB_SRCDIR=	${WRKDIR}/zlib

CPPFLAGS+=	-I${ZLIB_SRCDIR}
LDFLAGS+=	-L${ZLIB_SRCDIR}
LIBS+=		-lz

post-extract: zlib-extract
zlib-extract:
	${CP} -Rp ${ZLIB_FILESDIR} ${ZLIB_SRCDIR}

pre-configure: zlib-build
zlib-build:
	${RUN}								\
	cd ${ZLIB_SRCDIR} && 						\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS} ${CPPFLAGS}"\
		${MAKE_PROGRAM} libz.a
  else
  # This is the regular version of zlib package, for normal install
  #
DEPEND_USE+=		zlib
  endif

endif # ZLIB_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
