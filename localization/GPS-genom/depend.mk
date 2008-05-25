# $LAAS: depend.mk 2008/05/25 14:28:42 tho $
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
GPSGENOM_DEPEND_MK:=	${GPSGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		GPS-genom
endif

ifeq (+,$(GPSGENOM_DEPEND_MK))
PREFER.GPS-genom?=	robotpkg

DEPEND_USE+=		GPS-genom

DEPEND_ABI.GPS-genom?=	GPS-genom>=0.1
DEPEND_DIR.GPS-genom?=	../../localization/GPS-genom

SYSTEM_SEARCH.GPS-genom=\
	include/GPS/GPSStruct.h		\
	lib/pkgconfig/GPS.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
