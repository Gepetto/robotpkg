# $LAAS: depend.mk 2008/06/23 17:51:16 mallet $
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
#                                      Anthony Mallet on Wed Mar 19 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENHRP_JRL_DEPEND_MK:=	${OPENHRP_JRL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openhrp-jrl
endif

ifeq (+,$(OPENHRP_JRL_DEPEND_MK))
PREFER.openhrp-jrl?=	robotpkg

DEPEND_USE+=		openhrp-jrl

DEPEND_ABI.openhrp-jrl?=openhrp-jrl>=20060713r6
DEPEND_DIR.openhrp-jrl?=../../architecture/openhrp-jrl

SYSTEM_SEARCH.openhrp-jrl=\
	OpenHRP/bin/Auditor.sh			\
	OpenHRP/Common/corba/common.idl
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
