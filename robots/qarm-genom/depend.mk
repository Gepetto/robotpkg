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
QARMGENOM_DEPEND_MK:=	${QARMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qarm-genom
endif

ifeq (+,$(QARMGENOM_DEPEND_MK))# -------------------------------------
PREFER.qarm-genom?=	robotpkg

DEPEND_USE+=		qarm-genom

DEPEND_ABI.qarm-genom?=	qarm-genom>=1.1
DEPEND_DIR.qarm-genom?=	../../robots/qarm-genom

SYSTEM_SEARCH.qarm-genom=\
	include/qarm/qarmStruct.h		\
	lib/pkgconfig/qarm.pc

endif # QARMGENOM_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
