# $LAAS: depend.mk 2008/05/25 14:25:34 tho $
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
SEGLOCGENOM_DEPEND_MK:=	${SEGLOCGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		segloc-genom
endif

ifeq (+,$(SEGLOCGENOM_DEPEND_MK))
PREFER.segloc-genom?=	robotpkg

DEPEND_USE+=		segloc-genom

DEPEND_ABI.segloc-genom?=	segloc-genom>=0.3
DEPEND_DIR.segloc-genom?=	../../localization/segloc-genom

SYSTEM_SEARCH.segloc-genom=\
	include/segloc/seglocStruct.h		\
	lib/pkgconfig/segloc.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
