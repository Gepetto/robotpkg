# $LAAS: depend.mk 2009/07/21 16:54:38 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Fri Apr  4 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_INTERFACE_GIKTASK_DEPEND_MK:=${JRL_INTERFACE_GIKTASK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				jrl-interface-giktask
endif

ifeq (+,$(JRL_INTERFACE_GIKTASK_DEPEND_MK))
PREFER.jrl-interface-giktask?=		robotpkg

DEPEND_USE+=				jrl-interface-giktask

DEPEND_ABI.jrl-interface-giktask?=	jrl-interface-giktask>=2.4
DEPEND_DIR.jrl-interface-giktask?=	../../interfaces/jrl-interface-giktask

SYSTEM_SEARCH.jrl-interface-giktask=\
	include/gikTask/jrlGikStateConstraint.h		\
	lib/pkgconfig/abstractGikTask.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
