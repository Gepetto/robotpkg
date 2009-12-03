# $LAAS: pdflatex.mk 2009/12/03 15:10:47 mallet $
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
#                                      Anthony Mallet on Sun Nov  2 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PDFLATEX_DEPEND_MK:=	${PDFLATEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pdflatex
endif

ifeq (+,$(PDFLATEX_DEPEND_MK)) # -------------------------------------

PREFER.pdflatex?=	system
DEPEND_USE+=		pdflatex
DEPEND_ABI.pdflatex?=	pdflatex>=3.14

SYSTEM_SEARCH.pdflatex=	\
	'bin/pdflatex:/pdf/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% -version'

SYSTEM_PKG.Linux-fedora.pdflatex=texlive-latex
SYSTEM_PKG.Linux-ubuntu.pdflatex=texlive-latex-extra
SYSTEM_PKG.Linux-debian.pdflatex=texlive-latex-extra

export PDFLATEX=	${PREFIX.pdflatex}/bin/pdflatex

endif # PDFLATEX_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
