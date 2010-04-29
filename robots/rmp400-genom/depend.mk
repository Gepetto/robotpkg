#
# Copyright (c) 2008-2010 LAAS/CNRS
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

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RMP400GENOM_DEPEND_MK:=	${RMP400GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rmp400-genom
endif

ifeq (+,$(RMP400GENOM_DEPEND_MK))
PREFER.rmp400-genom?=	robotpkg

DEPEND_USE+=		rmp400-genom

DEPEND_ABI.rmp400-genom?=	rmp400-genom>=0.1
DEPEND_DIR.rmp400-genom?=	../../robots/rmp400-genom

SYSTEM_SEARCH.rmp400-genom=\
	include/rmp400/rmp400Struct.h		\
	lib/pkgconfig/rmp400.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
