# $LAAS: tcl.mk 2008/10/24 18:45:31 mallet $
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
#                                      Anthony Mallet on Thu Oct 23 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCL_DEPEND_MK:=		${TCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tcl
endif

ifeq (+,$(TCL_DEPEND_MK)) # ------------------------------------------

PREFER.tcl?=		system

DEPEND_USE+=		tcl

DEPEND_ABI.tcl?=	tcl>=8.0

SYSTEM_SEARCH.tcl=	\
	'bin/tclsh'					\
	'lib/tclConfig.sh:/TCL_VERSION/s/[^.0-9]*//gp'	\
	'include/tcl.h:/TCL_VERSION/s/[^.0-9]*//gp'

endif # TCL_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
