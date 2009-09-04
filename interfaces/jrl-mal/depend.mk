# $LAAS: depend.mk 2009/07/21 16:54:08 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                      Anthony Mallet on Fri Jan 30 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_MAL_DEPEND_MK:=	${JRL_MAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-mal
endif

ifeq (+,$(JRL_MAL_DEPEND_MK)) # --------------------------------------------

PREFER.jrl-mal?=	robotpkg

DEPEND_USE+=		jrl-mal

DEPEND_ABI.jrl-mal?=	jrl-mal>=1.7.4
DEPEND_DIR.jrl-mal?=	../../interfaces/jrl-mal

SYSTEM_SEARCH.jrl-mal=\
	include/MatrixAbstractLayer/abstract.h	\
	'lib/pkgconfig/MatrixAbstractLayer.pc:/Version/s/[^0-9.]//gp'

endif # JRL_MAL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

