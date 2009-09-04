# $LAAS: depend.mk 2008/05/25 14:09:47 tho $
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
#                                      Arnaud Degroote on Mon Apr 28 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
STEREOPIXELGENOM_DEPEND_MK:=	${STEREOPIXELGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		stereopixel-genom
endif

ifeq (+,$(STEREOPIXELGENOM_DEPEND_MK))
PREFER.stereopixel-genom?=	robotpkg

DEPEND_USE+=		stereopixel-genom

DEPEND_ABI.stereopixel-genom?=	stereopixel-genom>=1.2
DEPEND_DIR.stereopixel-genom?=	../../image/stereopixel-genom

SYSTEM_SEARCH.stereopixel-genom=\
	include/stereopixel/stereopixelStruct.h		\
	lib/pkgconfig/stereopixel.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
