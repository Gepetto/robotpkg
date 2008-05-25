# $LAAS: depend.mk 2008/05/25 14:02:53 tho $
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
LIBRAW1394_DEPEND_MK:=	${LIBRAW1394_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libraw1394
endif

ifeq (+,$(LIBRAW1394_DEPEND_MK))
PREFER.libraw1394?=	robotpkg

DEPEND_USE+=		libraw1394

DEPEND_ABI.libraw1394?=	libraw1394>=1.3.0
DEPEND_DIR.libraw1394?=	../../image/libraw1394

SYSTEM_SEARCH.libraw1394=\
	include/libraw1394/raw1394.h	\
	lib/pkgconfig/libraw1394.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
