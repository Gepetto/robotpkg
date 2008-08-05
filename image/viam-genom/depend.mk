# $LAAS: depend.mk 2008/08/05 14:28:45 mallet $
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
VIAMGENOM_DEPEND_MK:=	${VIAMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		viam-genom
endif

ifeq (+,$(VIAMGENOM_DEPEND_MK))
PREFER.viam-genom?=	robotpkg

DEPEND_USE+=		viam-genom

DEPEND_ABI.viam-genom?=	viam-genom>=1.2
DEPEND_DIR.viam-genom?=	../../image/viam-genom

SYSTEM_SEARCH.viam-genom=\
	include/viam/viamStruct.h		\
	lib/pkgconfig/viam.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
