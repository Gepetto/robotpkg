# $LAAS: depend.mk 2008/05/25 14:02:11 tho $
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
#                                       Anthony Mallet on Fri May 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBDC1394_DEPEND_MK:=	${LIBDC1394_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libdc1394
endif

ifeq (+,$(LIBDC1394_DEPEND_MK))
PREFER.libdc1394?=	robotpkg

DEPEND_USE+=		libdc1394

DEPEND_ABI.libdc1394?=	libdc1394>=2.0.1
DEPEND_DIR.libdc1394?=	../../image/libdc1394

SYSTEM_SEARCH.libdc1394=\
	include/dc1394/dc1394.h		\
	lib/pkgconfig/libdc1394-2.pc
endif

include ../../image/libraw1394/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
