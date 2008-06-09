# $LAAS: depend.mk 2008/05/25 15:44:20 tho $
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
#                                      Arnaud Degroote on Mon Jun 06 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MAPKIT_DEPEND_MK:=	${MAPKIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mapkit
endif

ifeq (+,$(MAPKIT_DEPEND_MK))
PREFER.mapkit?=	robotpkg

DEPEND_USE+=		mapkit

DEPEND_ABI.mapkit?=	mapkit>=1.0
DEPEND_DIR.mapkit?=	../../robots/mapkit

SYSTEM_SEARCH.mapkit=\
	include/mapkit/api_P.h \
	lib/pkgconfig/mapkit.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
