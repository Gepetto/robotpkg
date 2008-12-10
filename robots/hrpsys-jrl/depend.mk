# $LAAS: depend.mk 2008/12/10 18:32:36 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Anthony Mallet on Wed Oct 22 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRPSYS_JRL_DEPEND_MK:=	${HRPSYS_JRL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrpsys-jrl
endif

ifeq (+,$(HRPSYS_JRL_DEPEND_MK)) # -----------------------------------

PREFER.hrpsys-jrl?=	robotpkg

DEPEND_USE+=		hrpsys-jrl

DEPEND_ABI.hrpsys-jrl?=	hrpsys-jrl>=3.0.1
DEPEND_DIR.hrpsys-jrl?=	../../robots/hrpsys-jrl

SYSTEM_SEARCH.hrpsys-jrl=\
	Controller/IOserver/corba/HRPcontroller.h	\
	Controller/IOserver/robot/HRP2JRL/model/HRP2JRLmain.wrl

endif # HRPSYS_JRL_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
