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
DTMGENOM_DEPEND_MK:=	${DTMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dtm-genom
endif

ifeq (+,$(DTMGENOM_DEPEND_MK))
PREFER.dtm-genom?=	robotpkg

DEPEND_USE+=		dtm-genom

DEPEND_ABI.dtm-genom?=	dtm-genom>=0.1
DEPEND_DIR.dtm-genom?=	../../mapping/dtm-genom

SYSTEM_SEARCH.dtm-genom=\
	include/dtm/dtmStruct.h		\
	lib/pkgconfig/dtm.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
