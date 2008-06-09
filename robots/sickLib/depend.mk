# $LAAS: depend.mk 2008/05/25 15:46:14 tho $
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
SICKLIB_DEPEND_MK:=${SICKLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sickLib
endif

ifeq (+,$(SICKLIB_DEPEND_MK))
PREFER.sickLib?=	robotpkg

DEPEND_USE+=		sickLib

DEPEND_ABI.sickLib?=	sickLib>=1.0.1
DEPEND_DIR.sickLib?=	../../robots/sickLib

SYSTEM_SEARCH.sickLib=\
	include/sicklib/sick_lib.h \
	lib/pkgconfig/sickLib.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
