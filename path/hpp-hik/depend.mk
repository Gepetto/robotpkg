# $LAAS: depend.mk 2008/06/17 14:26:41 mallet $
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
HPP_HIK_DEPEND_MK:=	${HPP_HIK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-hik
endif

ifeq (+,$(HPP_HIK_DEPEND_MK)) # --------------------------------------

PREFER.hpp-hik?=	robotpkg

SYSTEM_SEARCH.hpp-hik=\
	include/hpp/hik/solver.hh \
	lib/pkgconfig/hpp-hik.pc
DEPEND_USE+=		hpp-hik

DEPEND_ABI.hpp-hik?=	hpp-hik>=1.2.0
DEPEND_DIR.hpp-hik?=	../../path/hpp-hik

endif # HPP_HIK_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
