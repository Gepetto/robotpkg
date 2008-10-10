# $LAAS: depend.mk 2008/10/07 13:58:12 mallet $
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
#                                      Anthony Mallet on Tue Oct  7 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENRTM_AIST_DEPEND_MK:=${OPENRTM_AIST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openrtm-aist
endif

ifeq (+,$(OPENRTM_AIST_DEPEND_MK)) # ---------------------------------

PREFER.openrtm-aist?=	robotpkg

DEPEND_USE+=		openrtm-aist

DEPEND_ABI.openrtm-aist?=openrtm-aist>=0.4.2
DEPEND_DIR.openrtm-aist?=../../architecture/openrtm-aist

SYSTEM_SEARCH.openrtm-aist=\
	bin/rtm-config			\
	include/rtm/RTC.h		\
	lib/libRTC.la

endif # --- OPENRTM_AIST_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
