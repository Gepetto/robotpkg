#
# Copyright (c) 2008,2010 LAAS/CNRS
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
#                                       Anthony Mallet on Wed May 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_MODEL_DEPEND_MK:=	${HPP_MODEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-model
endif

ifeq (+,$(HPP_MODEL_DEPEND_MK)) # ------------------------------------

PREFER.hpp-model?=	robotpkg

SYSTEM_SEARCH.hpp-model=\
	include/hppModel/hppDevice.h	\
	lib/libhppModel.la

DEPEND_USE+=		hpp-model

DEPEND_ABI.hpp-model?=	hpp-model>=1.7.5
DEPEND_DIR.hpp-model?=	../../devel/hpp-model

include ../../path/kineo-pp/depend.mk

endif # HPP_MODEL_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
