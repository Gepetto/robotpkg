# $LAAS: graphviz.mk 2008/12/16 00:01:29 tho $
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
#                                      Anthony Mallet on Mon Dec 15 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GRAPHVIZ_DEPEND_MK:=	${GRAPHVIZ_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		graphviz
endif

ifeq (+,$(GRAPHVIZ_DEPEND_MK)) # -------------------------------------------

PREFER.graphviz?=	system

DEPEND_USE+=		graphviz
DEPEND_ABI.graphviz?=	graphviz>=2
DEPEND_METHOD.graphviz+=build

SYSTEM_SEARCH.graphviz=\
	'bin/dot:s/(.*)//;s/[^.0-9]//gp:% -V'

endif # GRAPHVIZ_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
