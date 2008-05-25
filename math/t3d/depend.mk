# $LAAS: depend.mk 2008/05/25 14:31:35 tho $
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
#                                      Arnaud Degroote on Thu May 15 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBT3D_DEPEND_MK:=	${LIBT3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libt3d
endif

ifeq (+,$(LIBT3D_DEPEND_MK))
PREFER.libt3d?=	robotpkg

DEPEND_USE+=		libt3d

DEPEND_ABI.libt3d?=libt3d>=2.5
DEPEND_DIR.libt3d?=../../math/t3d

SYSTEM_SEARCH.libt3d=\
	include/t3d/t3d.h	\
	lib/pkgconfig/t3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
