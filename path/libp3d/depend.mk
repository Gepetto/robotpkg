# $LAAS: depend.mk 2008/05/25 15:17:36 tho $
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
#                                      Arnaud Degroote on Fri May 16 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBP3D_DEPEND_MK:=${LIBP3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libp3d
endif

ifeq (+,$(LIBP3D_DEPEND_MK))
PREFER.libp3d?=	robotpkg

DEPEND_USE+=		libp3d

DEPEND_ABI.libp3d?=	libp3d>=1.0
DEPEND_DIR.libp3d?=	../../path/libp3d

SYSTEM_SEARCH.libp3d=\
	include/libp3d.h	\
	lib/pkgconfig/libp3d.pc
endif

include ../../math/t3d/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
