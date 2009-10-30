# $LAAS: depend.mk 2009/03/09 15:19:44 mallet $
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
#                                      Anthony Mallet on Wed May 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_BUILDER_DEPEND_MK:=	${HRP2_BUILDER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		robotbuilder
endif

ifeq (+,$(HRP2_BUILDER_DEPEND_MK)) # --------------------------------------

PREFER.robotbuilder?=	robotpkg

SYSTEM_SEARCH.robotbuilder=\
	include/robotbuilder/robotbuilder.hh \
	lib/pkgconfig/robotbuilder.pc

DEPEND_USE+=		robotbuilder

DEPEND_ABI.robotbuilder?=	robotbuilder>=1.0
DEPEND_DIR.robotbuilder?=	../../robots/hrp2-builder

endif # HRP2_BUILDER_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
