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
SEGKIT_DEPEND_MK:=	${SEGKIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		segkit
endif

ifeq (+,$(SEGKIT_DEPEND_MK))
PREFER.segkit?=	robotpkg

DEPEND_USE+=		segkit

DEPEND_ABI.segkit?=	segkit>=1.0
DEPEND_DIR.segkit?=	../../robots/segkit

SYSTEM_SEARCH.segkit=\
	include/segkit/lasdef.h \
	lib/pkgconfig/segkit.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
