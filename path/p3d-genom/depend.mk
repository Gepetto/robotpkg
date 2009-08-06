# $LAAS: depend.mk 2008/05/25 15:21:40 tho $
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
#                                      Arnaud Degroote on Mon May 19 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
P3DGENOM_DEPEND_MK:=	${P3DGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		p3d-genom
endif

ifeq (+,$(P3DGENOM_DEPEND_MK))
PREFER.p3d-genom?=	robotpkg

DEPEND_USE+=		p3d-genom

DEPEND_ABI.p3d-genom?=	p3d-genom>=1.1
DEPEND_DIR.p3d-genom?=	../../path/p3d-genom

SYSTEM_SEARCH.p3d-genom=\
	include/p3d/p3dStruct.h		\
	lib/pkgconfig/p3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
