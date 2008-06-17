# $LAAS: depend.mk 2008/06/17 16:26:17 mallet $
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
#                                      Anthony Mallet on Wed May 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_WALKPLANNER_DEPEND_MK:=${HPP_WALKPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-walkplanner
endif

ifeq (+,$(HPP_WALKPLANNER_DEPEND_MK)) # ------------------------------

PREFER.hpp-walkplanner?=	robotpkg

SYSTEM_SEARCH.hpp-walkplanner=\
	include/hppWalkPlanner/hppWalkPlanner.h	\
	lib/libhppWalkPlanner.la

DEPEND_USE+=		hpp-walkplanner

DEPEND_ABI.hpp-walkplanner?=hpp-walkplanner>=1.3.2
DEPEND_DIR.hpp-walkplanner?=../../path/hpp-walkplanner

endif # HPP_WALKPLANNER_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
