# $LAAS: depend.mk 2009/02/09 14:44:27 tho $
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
#                                      Anthony Mallet on Sat Apr 19 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFETCH_DEPEND_MK:=	${LIBFETCH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libfetch
endif

ifeq (+,$(LIBFETCH_DEPEND_MK))
PREFER.libfetch?=	robotpkg

SYSTEM_SEARCH.libfetch=	\
	include/fetch.h	\
	lib/libfetch.a

DEPEND_ABI.libfetch?=	libfetch>=2.4
DEPEND_DIR.libfetch?=	../../net/libfetch

DEPEND_LIBS.libfetch+=	-lfetch

  # pull-in the user preferences for libfetch now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(LIBFETCH_STYLE)+$(PREFER.libfetch)))
  # This is the "inplace" version of libfetch package, for bootstrap process
  #
LIBFETCH_FILESDIR=	${ROBOTPKG_DIR}/net/libfetch/dist
LIBFETCH_SRCDIR=	${WRKDIR}/libfetch

CPPFLAGS+=	-I${LIBFETCH_SRCDIR}
LDFLAGS+=	-L${LIBFETCH_SRCDIR}
LIBS+=		-lfetch

post-extract: libfetch-extract
libfetch-extract:
	@${STEP_MSG} "Extracting libfetch in place"
	${CP} -Rp ${LIBFETCH_FILESDIR} ${LIBFETCH_SRCDIR}

pre-configure: libfetch-build
libfetch-build:
	@${STEP_MSG} "Building libfetch in place"
	${RUN}								\
	cd ${LIBFETCH_SRCDIR} && 					\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS}"		\
		CPPFLAGS="${CPPFLAGS}" ${MAKE_PROGRAM} depend all
  else
  # This is the regular version of libfetch package, for normal install
  #
DEPEND_USE+=		libfetch
  endif
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
