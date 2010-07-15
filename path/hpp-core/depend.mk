#
# Copyright (c) 2008,2010 LAAS/CNRS
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
HPPCORE_DEPEND_MK:=	${HPPCORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-core
endif

ifeq (+,$(HPPCORE_DEPEND_MK)) # --------------------------------------

PREFER.hpp-core?=	robotpkg

DEPEND_USE+=		hpp-core

DEPEND_ABI.hpp-core?=	hpp-core>=1.11
DEPEND_DIR.hpp-core?=	../../path/hpp-core

SYSTEM_SEARCH.hpp-core=\
	include/hppCore/hppProblem.h	\
	lib/libhppCore.la

endif # HPPCORE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
