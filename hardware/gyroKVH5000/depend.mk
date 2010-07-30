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
#                                      Arnaud Degroote on Mon July 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GYROKVH5000_DEPEND_MK:=${GYROKVH5000_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyroKVH5000
endif

ifeq (+,$(GYROKVH5000_DEPEND_MK))
PREFER.gyroKVH5000?=	robotpkg

DEPEND_USE+=		gyroKVH5000

DEPEND_ABI.gyroKVH5000?=	gyroKVH5000>=1.4
DEPEND_DIR.gyroKVH5000?=	../../hardware/gyroKVH5000

DEPEND_PKG_CONFIG.gyroKVH5000+=lib/pkgconfig

SYSTEM_SEARCH.gyroKVH5000=\
	bin/gyroKVH5000Test\
	include/gyroLib.h \
	lib/pkgconfig/gyroKVH5000.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
