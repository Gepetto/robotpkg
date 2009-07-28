# $LAAS: depend.mk 2009/07/28 12:39:02 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                         Nizar Sallem on Tue Jul 28 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FORCEGENOM_DEPEND_MK:=	${FORCEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		force-genom
endif

ifeq (+,$(FORCEGENOM_DEPEND_MK))
PREFER.force-genom?=	robotpkg

DEPEND_USE+=		force-genom

DEPEND_ABI.force-genom?=	force-genom>=1.1
DEPEND_DIR.force-genom?=	../../hardware/force-genom

SYSTEM_SEARCH.force-genom=\
	include/force/forceStruct.h		\
	lib/pkgconfig/force.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
