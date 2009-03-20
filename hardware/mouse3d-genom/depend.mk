# $LAAS: depend.mk 2008/05/25 15:19:35 tho $
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
MOUSE3DGENOM_DEPEND_MK:=	${MOUSE3DGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mouse3d-genom
endif

ifeq (+,$(MOUSE3DGENOM_DEPEND_MK))
PREFER.mouse3d-genom?=	robotpkg

DEPEND_USE+=		mouse3d-genom

DEPEND_ABI.mouse3d-genom?=	mouse3d-genom>=1.0
DEPEND_DIR.mouse3d-genom?=	../../hardware/mouse3d-genom

SYSTEM_SEARCH.mouse3d-genom=\
	include/mouse3d/mouse3dStruct.h		\
	lib/pkgconfig/mouse3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
