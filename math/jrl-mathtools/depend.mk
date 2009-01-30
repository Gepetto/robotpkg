# $LAAS: depend.mk 2009/01/30 18:52:09 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
JRLMATHTOOLS_DEPEND_MK:=${JRLMATHTOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-mathtools
endif

ifeq (+,$(JRLMATHTOOLS_DEPEND_MK)) # ---------------------------------

PREFER.jrl-mathtools?=	robotpkg

DEPEND_USE+=		jrl-mathtools

DEPEND_ABI.jrl-mathtools?=jrl-mathtools>=1.1
DEPEND_DIR.jrl-mathtools?=../../math/jrl-mathtools

SYSTEM_SEARCH.jrl-mathtools=\
	include/jrlMathTools/vector4.h

endif # JRLMATHTOOLS_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
