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
NDDGENOM_DEPEND_MK:=	${NDDGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ndd-genom
endif

ifeq (+,$(NDDGENOM_DEPEND_MK))
PREFER.ndd-genom?=	robotpkg

DEPEND_USE+=		ndd-genom

DEPEND_ABI.ndd-genom?=	ndd-genom>=1.0
DEPEND_DIR.ndd-genom?=	../../path/ndd-genom

SYSTEM_SEARCH.ndd-genom=\
	include/ndd/nddStruct.h		\
	lib/pkgconfig/ndd.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
