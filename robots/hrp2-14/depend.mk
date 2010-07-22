#
# Copyright (c) 2008-2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Wed May 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_14_DEPEND_MK:=	${HRP2_14_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrp2_14
endif

ifeq (+,$(HRP2_14_DEPEND_MK)) # --------------------------------------

PREFER.hrp2_14?=	robotpkg

SYSTEM_SEARCH.hrp2_14=\
	include/hrp2_14/hrp2_14.h

DEPEND_USE+=		hrp2_14

DEPEND_ABI.hrp2_14?=	hrp2_14>=1.7.5
DEPEND_DIR.hrp2_14?=	../../robots/hrp2-14

endif # HRP2_14_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
