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
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BWIDGET_DEPEND_MK:=	${BWIDGET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		bwidget
endif

ifeq (+,$(BWIDGET_DEPEND_MK)) # -------------------------------------------

PREFER.bwidget?=	system
DEPEND_USE+=		bwidget

DEPEND_ABI.bwidget?=	bwidget>=1.8

SYSTEM_SEARCH.bwidget=	\
	'{lib,share/{tcl{,[0-9.]*},tcltk{,[0-9]*}}}/bwidget{,[0-9]*}/pkgIndex.tcl:/BWidget/{s/[^.0-9]*//gp;q;}'

endif # BWIDGET_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
