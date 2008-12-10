# $LAAS: depend.mk 2008/12/10 22:26:25 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
#                                       Anthony Mallet on Thu Apr 24 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_KWSPLUS_DEPEND_MK:=	${HPP_KWSPLUS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-kwsplus
endif

ifeq (+,$(HPP_KWSPLUS_DEPEND_MK)) # ----------------------------------

PREFER.hpp-kwsplus?=	robotpkg

SYSTEM_SEARCH.hpp-kwsplus=\
	include/kwsPlus/kwsPlusRoadmap.h	\
	lib/libkwsPlus.la

DEPEND_USE+=		hpp-kwsplus

DEPEND_ABI.hpp-kwsplus?=hpp-kwsplus>=1.5
DEPEND_DIR.hpp-kwsplus?=../../devel/hpp-kwsplus

include ../../path/kineo-pp/depend.mk

endif # HPP_KWSPLUS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
