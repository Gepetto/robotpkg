#
# Copyright (c) 2009 LAAS/CNRS
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
#                                    Florent Lamiraux on Fri Oct 30 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_BUILDER_DEPEND_MK:=${HRP2_BUILDER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hrp2-builder
endif

ifeq (+,$(HRP2_BUILDER_DEPEND_MK)) # ---------------------------------------

PREFER.hrp2-builder?=		robotpkg

SYSTEM_SEARCH.hrp2-builder=\
	include/robotbuilder/robotbuilder.hh \
	lib/pkgconfig/robotbuilder.pc

DEPEND_USE+=			hrp2-builder

DEPEND_ABI.hrp2-builder?=	hrp2-builder>=1.0
DEPEND_DIR.hrp2-builder?=	../../robots/hrp2-builder

endif # HRP2_BUILDER_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
