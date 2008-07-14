# $LAAS: depend.mk 2008/05/25 14:25:34 tho $
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
#                                      Arnaud Degroote on Mon May 19 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GYROGENOM_DEPEND_MK:=	${GYROGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyro-genom
endif

ifeq (+,$(GYROGENOM_DEPEND_MK))
PREFER.gyro-genom?=	robotpkg

DEPEND_USE+=		gyro-genom

DEPEND_ABI.gyro-genom?=	gyro-genom>=0.2
DEPEND_DIR.gyro-genom?=	../../localization/gyro-genom

SYSTEM_SEARCH.gyro-genom=\
	include/gyro/gyroStruct.h		\
	lib/pkgconfig/gyro.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
