# $LAAS: depend.mk 2008/06/17 18:24:22 mallet $
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
ODOKIT_DEPEND_MK:=	${ODOKIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		odokit
endif

ifeq (+,$(ODOKIT_DEPEND_MK))
PREFER.odokit?=	robotpkg

DEPEND_USE+=		odokit

DEPEND_ABI.odokit?=	odokit>=1.0
DEPEND_DIR.odokit?=	../../localization/odokit

SYSTEM_SEARCH.odokit=\
	include/odokit/odometer.h \
	lib/pkgconfig/odokit.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
