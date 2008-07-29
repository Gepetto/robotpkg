# $LAAS: depend.mk 2008/07/29 18:00:43 mallet $
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
EVART_CLIENT_DEPEND_MK:=${EVART_CLIENT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		evart-client
endif

ifeq (+,$(EVART_CLIENT_DEPEND_MK)) # ---------------------------------
PREFER.evart-client?=	robotpkg

DEPEND_USE+=		evart-client

DEPEND_ABI.evart-client?=	evart-client>=1.4
DEPEND_DIR.evart-client?=	../../net/evart-client

SYSTEM_SEARCH.evart-client=\
	bin/evart-client	\
	include/evart-client.h

endif # EVART_CLIENT_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
