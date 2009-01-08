# $LAAS: latex.mk 2009/01/08 15:42:45 mallet $
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
#                                     Anthony Mallet on Thue Jan  8 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LATEX_DEPEND_MK:=	${LATEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		latex
endif

ifeq (+,$(LATEX_DEPEND_MK)) # ----------------------------------------

PREFER.latex?=	system
DEPEND_USE+=		latex
DEPEND_ABI.latex?=	latex>=3.14

SYSTEM_SEARCH.latex=	\
	'bin/latex:/pdf/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% -version'	\
	'bin/dvips'

endif # LATEX_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
