# $LAAS: depend.mk 2008/05/25 14:07:47 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Fri Mar 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSTEREOPIXEL_DEPEND_MK:=${LIBSTEREOPIXEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libstereopixel
endif

ifeq (+,$(LIBSTEREOPIXEL_DEPEND_MK))
PREFER.libstereopixel?=	robotpkg

DEPEND_USE+=		libstereopixel

DEPEND_ABI.libstereopixel?=	libstereopixel>=1.2
DEPEND_DIR.libstereopixel?=	../../image/libstereopixel

SYSTEM_SEARCH.libstereopixel=\
	include/libstereopixel.h	\
	lib/pkgconfig/libstereopixel.pc
endif

include ../../image/libimages3d/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
