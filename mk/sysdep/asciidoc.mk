#
# Copyright (c) 2010 LAAS/CNRS
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
#                                     Thomas Moulard on Thue Jan  2 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ASCIIDOC_DEPEND_MK:=	${ASCIIDOC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		asciidoc
endif

ifeq (+,$(ASCIIDOC_DEPEND_MK)) # ----------------------------------------

PREFER.asciidoc?=	system
DEPEND_USE+=		asciidoc	
DEPEND_ABI.asciidoc?=	asciidoc>=8.2.5

SYSTEM_PKG.Fedora.asciidoc=asciidoc
SYSTEM_PKG.Ubuntu.asciidoc=asciidoc
SYSTEM_PKG.Debian.asciidoc=asciidoc
#SYSTEM_PKG.NetBSD.asciidoc=


SYSTEM_SEARCH.asciidoc=	\
	'bin/asciidoc:/asciidoc/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% --version'

endif # ASCIIDOC_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
