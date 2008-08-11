# $LAAS: depend.mk 2008/05/25 13:26:53 tho $
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
#                                      Arnaud Degroote on Sat May 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GDHE_DEPEND_MK:=${GDHE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gdhe
endif

ifeq (+,$(GDHE_DEPEND_MK))
PREFER.gdhe?=	robotpkg

DEPEND_USE+=		gdhe

DEPEND_ABI.gdhe?=	gdhe>=3.7
DEPEND_DIR.gdhe?=	../../graphics/gdhe

SYSTEM_SEARCH.gdhe=\
	include/gdhe/GDHE.h	\
	lib/pkgconfig/gdhe.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
