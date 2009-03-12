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
PA10LIBS_DEPEND_MK:=	${PA10LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pa10-libs
endif

ifeq (+,$(PA10LIBS_DEPEND_MK)) # -------------------------------------
PREFER.pa10-libs?=	robotpkg

DEPEND_USE+=		pa10-libs

DEPEND_ABI.pa10-libs?=	pa10-libs>=1.1.1
DEPEND_DIR.pa10-libs?=	../../hardware/pa10-libs

SYSTEM_SEARCH.pa10-libs=\
	include/pa10-libs/pacmd.h \
	include/pa10-libs/pactl.h \
	include/pa10-libs/paerr.h \
	include/pa10-libs/pa.h    \
	include/pa10-libs/pammc.h \
	include/pa10-libs/papci.h \
	lib/pkgconfig/pa10-libs.pc \
	lib/libpapci.a 

endif # PA10LIBS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
