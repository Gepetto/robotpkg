# $LAAS: depend.mk 2008/05/25 15:44:20 tho $
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
RFLEXGENOM_DEPEND_MK:=	${RFLEXGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rflex-genom
endif

ifeq (+,$(RFLEXGENOM_DEPEND_MK))
PREFER.rflex-genom?=	robotpkg

DEPEND_USE+=		rflex-genom

DEPEND_ABI.rflex-genom?=	rflex-genom>=0.2
DEPEND_DIR.rflex-genom?=	../../robots/rflex-genom

SYSTEM_SEARCH.rflex-genom=\
	include/rflex/rflexStruct.h		\
	lib/pkgconfig/rflex.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
