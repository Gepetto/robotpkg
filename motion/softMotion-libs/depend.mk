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
SOFTMOTION-LIBS_DEPEND_MK:=	${SOFTMOTION-LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		softMotion-libs
endif

ifeq (+,$(SOFTMOTION-LIBS_DEPEND_MK)) # ----------------------------------

PREFER.softMotion-libs?=	robotpkg

SYSTEM_SEARCH.softMotion-libs=\
	include/softMotion/softMotion.h \
	lib/libsoftMotion.so

DEPEND_USE+=		softMotion-libs

DEPEND_ABI.softMotion-libs?=softMotion-libs>=2.0
DEPEND_DIR.softMotion-libs?=../../motion/softMotion-libs

endif # SOFTMOTION-LIBS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
