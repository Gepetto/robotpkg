# Copyright (c) 2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
#                                    Severin Lemaignan on Tue 31 Aug 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ARTOOLKITPLUS_DEPEND_MK:=	${ARTOOLKITPLUS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		artoolkitplus
endif

ifeq (+,$(ARTOOLKITPLUS_DEPEND_MK)) # ----------------------------------

PREFER.artoolkitplus?=	robotpkg

SYSTEM_SEARCH.artoolkitplus=\
	include/ARToolKitPlus/ar.h	\
	lib/libARToolKitPlus.so

DEPEND_USE+=		artoolkitplus

DEPEND_ABI.artoolkitplus?=artoolkitplus>=2.1.1
DEPEND_DIR.artoolkitplus?=../../image/artoolkitplus


endif # ARTOOLKITPLUS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
