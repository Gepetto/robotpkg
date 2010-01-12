#
# Copyright (c) 2010 LAAS/CNRS
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
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JLOCOGENOM_DEPEND_MK:=	${JLOCOGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jloco-genom
endif

ifeq (+,$(JLOCOGENOM_DEPEND_MK))
PREFER.jloco-genom?=	robotpkg

DEPEND_USE+=		jloco-genom

DEPEND_ABI.jloco-genom?=	jloco-genom>=1.1r1
DEPEND_DIR.jloco-genom?=	../../robots/jloco-genom

SYSTEM_SEARCH.jloco-genom=\
	include/jloco/jlocoStruct.h		\
	lib/pkgconfig/jloco.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
