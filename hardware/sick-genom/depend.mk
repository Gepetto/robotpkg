# $LAAS: depend.mk 2008/06/17 18:28:57 mallet $
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
#                                      Arnaud Degroote on Wed May 21 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SICKGENOM_DEPEND_MK:=	${SICKGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sick-genom
endif

ifeq (+,$(SICKGENOM_DEPEND_MK))
PREFER.sick-genom?=	robotpkg

DEPEND_USE+=		sick-genom

DEPEND_ABI.sick-genom?=	sick-genom>=0.1
DEPEND_DIR.sick-genom?=	../../hardware/sick-genom

SYSTEM_SEARCH.sick-genom=\
	include/sick/sickStruct.h		\
	lib/pkgconfig/sick.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
