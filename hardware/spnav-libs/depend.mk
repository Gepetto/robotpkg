# $LAAS: depend.mk 2009/03/20 18:12:25 xbroquer $
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
#                                      Xavier Broquere
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPNAV_LIBS_DEPEND_MK:=${SPNAV_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		spnav-libs
endif

ifeq (+,$(SPNAV_LIBS_DEPEND_MK))
PREFER.spnav-libs?=	robotpkg

DEPEND_USE+=		spnav-libs

DEPEND_ABI.spnav-libs?=	spnav-libs>=1.0
DEPEND_DIR.spnav-libs?=	../../hardware/spnav-libs

DEPEND_PKG_CONFIG.spnav-libs+=lib/pkgconfig

SYSTEM_SEARCH.spnav-libs=\
	include/spnav-libs/spnav.h \
	lib/libspnav.so	\
	lib/pkgconfig/spnav-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
