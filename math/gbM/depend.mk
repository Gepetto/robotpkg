# $LAAS: depend.mk 2008/12/09 11:07:56 mallet $
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
#                                     Xavier Broquere, on Tue Mar 10 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GBM_DEPEND_MK:=	${GBM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gbM
endif

ifeq (+,$(GBM_DEPEND_MK)) # -------------------------------------
PREFER.gbM?=	robotpkg

DEPEND_USE+=		gbM

DEPEND_ABI.gbM?=	gbM>=0.2
DEPEND_DIR.gbM?=	../../math/gbM

SYSTEM_SEARCH.gbM=\
	include/gbM/Proto_gb.h \
	include/gbM/Proto_gbModeles.h \
	include/gbM/gb.h \
	include/gbM/gbGENOM.h \
	include/gbM/gbStruct.h \
	lib/pkgconfig/gbM.pc

endif # GBM_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
