# $LAAS: depend.mk 2008/05/25 15:23:46 tho $
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
#                                      Arnaud Degroote on Sat May 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBDTM_DEPEND_MK:=	${LIBDTM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libdtm
endif

ifeq (+,$(LIBDTM_DEPEND_MK)) # ---------------------------------------
PREFER.libdtm?=	robotpkg

DEPEND_USE+=		libdtm

DEPEND_ABI.libdtm?=	libdtm>=1.0
DEPEND_DIR.libdtm?=	../../path/libdtm

SYSTEM_SEARCH.libdtm=\
	include/libdtm.h	\
	lib/pkgconfig/libdtm.pc

include ../../math/t3d/depend.mk
include ../../image/libimages3d/depend.mk

endif # LIBDTM_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
