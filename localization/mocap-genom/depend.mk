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
MOCAP-GENOM_DEPEND_MK:=	${MOCAP-GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mocap-genom
endif

ifeq (+,$(MOCAP-GENOM_DEPEND_MK)) # ----------------------------------

PREFER.mocap-genom?=	robotpkg

SYSTEM_SEARCH.mocap-genom=\
	include/mocap/mocapStruct.h		\
	lib/pkgconfig/mocap.pc		\
	bin/mocap

DEPEND_USE+=		mocap-genom

DEPEND_ABI.mocap-genom?=mocap-genom>=1.1
DEPEND_DIR.mocap-genom?=../../localization/mocap-genom

endif # MOCAP-GENOM_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
