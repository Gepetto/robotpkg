# $LAAS: depend.mk 2009/02/03 01:04:12 tho $
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
#                                      Anthony Mallet on Tue May 13 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
KINEO_PP_DEPEND_MK:=	${KINEO_PP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		kineo-pp
endif

ifeq (+,$(KINEO_PP_DEPEND_MK)) # -------------------------------------

PREFER.kineo-pp?=	robotpkg

DEPEND_USE+=		kineo-pp

DEPEND_ABI.kineo-pp?=	kineo-pp>=2.04.501r1
DEPEND_DIR.kineo-pp?=	../../path/kineo-pp

endif # KINEO_PP_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

GCC_REQUIRED+=		>=4.0
include ../../devel/boost-headers/depend.mk
