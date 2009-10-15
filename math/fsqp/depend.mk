# $LAAS: depend.mk 2009/02/02 16:36:09 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                      Florent Lamiraux on Oct 14, 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FSQP_DEPEND_MK:=${FSQP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		fsqp
endif

ifeq (+,$(FSQP_DEPEND_MK)) # --------------------------------

PREFER.fsqp?=	robotpkg

DEPEND_USE+=		fsqp

SYSTEM_SEARCH.fsqp=\
	include/fsqp/cfsqpusr.h	\
	lib/pkgconfig/fsqp.pc

DEPEND_ABI.fsqp?=	fsqp>=2.5
DEPEND_DIR.fsqp?=	../../math/fsqp

endif # FSQP_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
