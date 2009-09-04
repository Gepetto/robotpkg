# $LAAS: depend.mk 2008/05/25 14:22:52 tho $
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
#                                       Xavier Broquere, on Tue Mar 10 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
XARMGENOM_DEPEND_MK:=	${XARMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		xarm-genom
endif

ifeq (+,$(XARMGENOM_DEPEND_MK))# -------------------------------------
PREFER.xarm-genom?=	robotpkg

DEPEND_USE+=		xarm-genom

DEPEND_ABI.xarm-genom?=	xarm-genom>=1.0
DEPEND_DIR.xarm-genom?=	../../robots/xarm-genom

SYSTEM_SEARCH.xarm-genom=\
	include/xarm/xarmStruct.h		\
	lib/pkgconfig/xarm.pc

endif # XARMGENOM_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
