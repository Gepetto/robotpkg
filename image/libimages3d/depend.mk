# $LAAS: depend.mk 2008/05/25 14:05:12 tho $
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
LIBIMAGES3D_DEPEND_MK:=	${LIBIMAGES3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libimages3d
endif

ifeq (+,$(LIBIMAGES3D_DEPEND_MK))
PREFER.libimages3d?=	robotpkg

DEPEND_USE+=		libimages3d

DEPEND_ABI.libimages3d?=libimages3d>=3.3
DEPEND_DIR.libimages3d?=../../image/libimages3d

SYSTEM_SEARCH.libimages3d=\
	include/libimages3d.h	\
	lib/pkgconfig/libimages3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
