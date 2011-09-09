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
#                                      Anthony Mallet on Thu Dec  3 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BIBTEX_DEPEND_MK:=	${BIBTEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		bibtex
endif

ifeq (+,$(BIBTEX_DEPEND_MK)) # ---------------------------------------------

PREFER.bibtex?=		system
DEPEND_USE+=		bibtex
DEPEND_ABI.bibtex?=	bibtex>=0.99

SYSTEM_SEARCH.bibtex=	\
	'{bin/,}bibtex:/BibTeX/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% -version'

SYSTEM_PKG.Fedora.bibtex=texlive

export BIBTEX=	$(word 1,${SYSTEM_FILES.bibtex})

endif # BIBTEX_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
