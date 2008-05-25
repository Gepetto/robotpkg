# $LAAS: depend.mk 2008/05/25 14:13:12 tho $
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
#                                       Anthony Mallet on Fri Mar 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VIAMLIBS_DEPEND_MK:=	${VIAMLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		viam-libs
endif

ifeq (+,$(VIAMLIBS_DEPEND_MK))
PREFER.viam-libs?=	robotpkg

DEPEND_USE+=		viam-libs

DEPEND_ABI.viam-libs?=	viam-libs>=1.0
DEPEND_DIR.viam-libs?=	../../image/viam-libs

SYSTEM_SEARCH.viam-libs=\
	include/viamlib.h		\
	lib/pkgconfig/viam-libs.pc
endif

include ../../image/libdc1394/depend.mk
include ../../image/opencv/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
