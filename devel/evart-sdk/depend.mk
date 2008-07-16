# $LAAS: depend.mk 2008/07/15 11:54:11 mallet $
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
#                                      Anthony Mallet on Tue Jul 15 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
EVART_SDK_DEPEND_MK:=	${EVART_SDK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		evart-sdk
endif

ifeq (+,$(EVART_SDK_DEPEND_MK)) # ------------------------------------
PREFER.evart-sdk?=	robotpkg

DEPEND_USE+=		evart-sdk

DEPEND_ABI.evart-sdk?=	evart-sdk>=1.0.1
DEPEND_DIR.evart-sdk?=	../../devel/evart-sdk

SYSTEM_SEARCH.evart-sdk=\
	bin/EVaComm2.dll		\
	include/EVaRT2.h

endif # EVART_SDK_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
