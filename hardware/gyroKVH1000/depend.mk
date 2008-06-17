# $LAAS: depend.mk 2008/06/17 18:12:25 mallet $
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
#                                      Arnaud Degroote on Tue May 20 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GYROKVH1000_DEPEND_MK:=${GYROKVH1000_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyroKVH1000
endif

ifeq (+,$(GYROKVH1000_DEPEND_MK))
PREFER.gyroKVH1000?=	robotpkg

DEPEND_USE+=		gyroKVH1000

DEPEND_ABI.gyroKVH1000?=	gyroKVH1000>=1.0.1
DEPEND_DIR.gyroKVH1000?=	../../hardware/gyroKVH1000

DEPEND_PKG_CONFIG.gyroKVH1000+=lib/pkgconfig

SYSTEM_SEARCH.gyroKVH1000=\
	bin/gyroKVH1000TaskTest \
	include/gyroKVH1000HardLib.h \
	lib/pkgconfig/gyroKVH1000Hard.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
