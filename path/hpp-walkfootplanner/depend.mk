# $LAAS: depend.mk 2008/09/17 14:34:07 mallet $
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
#                                      Anthony Mallet on Wed Sep 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPWALKFOOTPLANNER_DEPEND_MK:=${HPPWALKFOOTPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-walkfootplanner
endif

ifeq (+,$(HPPWALKFOOTPLANNER_DEPEND_MK)) # ---------------------------

PREFER.hpp-walkfootplanner?=	robotpkg

DEPEND_USE+=			hpp-walkfootplanner

DEPEND_ABI.hpp-walkplanner?=	hpp-walkfootplanner>=1.0
DEPEND_DIR.hpp-walkplanner?=	../../path/hpp-walkfootplanner

SYSTEM_SEARCH.hpp-walkfootplanner=\
	include/hppWalkFootPlanner/hppWalkFootPlanner.h	\
	lib/libhppWalkFootPlanner.la

endif # HPPWALKFOOTPLANNER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
