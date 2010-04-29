# $LAAS: depend.mk 2009/01/23 17:15:29 mallet $
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
#                                      Arnaud Degroote on Tue Jun 10 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PILOGENOM_DEPEND_MK:=	${PILOGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pilo-genom
endif

ifeq (+,$(PILOGENOM_DEPEND_MK))
PREFER.pilo-genom?=	robotpkg

DEPEND_USE+=		pilo-genom

DEPEND_ABI.pilo-genom?=	pilo-genom>=1.2
DEPEND_DIR.pilo-genom?=	../../motion/pilo-genom

SYSTEM_SEARCH.pilo-genom=\
	include/pilo/piloStruct.h		\
	'lib/pkgconfig/pilo.pc:/Version/s/[^0-9.]//gp'
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
