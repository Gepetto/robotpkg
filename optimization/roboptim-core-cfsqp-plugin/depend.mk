# $LAAS: depend.mk 2009/02/02 16:36:09 mallet $
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
#                                      Florent Lamiraux on Oct 14, 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROBOPTIM-CORE-CFSQP-PLUGIN_DEPEND_MK:=${ROBOPTIM-CORE-CFSQP-PLUGIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		roboptim-core-cfsqp-plugin
endif

ifeq (+,$(ROBOPTIM-CORE-CFSQP-PLUGIN_DEPEND_MK)) # --------------------------------

PREFER.roboptim-core-cfsqp-plugin?=	robotpkg

DEPEND_USE+=		roboptim-core-cfsqp-plugin

SYSTEM_SEARCH.roboptim-core-cfsqp-plugin=\
	include/roboptim/core/plugin/cfsqp.hh

DEPEND_ABI.roboptim-core-cfsqp-plugin?=	roboptim-core-cfsqp-plugin>=0.4
DEPEND_DIR.roboptim-core-cfsqp-plugin?=	../../optimization/roboptim-core-cfsqp-plugin

endif # ROBOPTIM-CORE-CFSQP-PLUGIN_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
