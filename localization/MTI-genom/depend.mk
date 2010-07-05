# $LAAS: depend.mk 2008/05/25 14:25:34 tho $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Arnaud Degroote on Mon May 19 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MTIGENOM_DEPEND_MK:=	${MTIGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		MTI-genom
endif

ifeq (+,$(MTIGENOM_DEPEND_MK))
PREFER.MTI-genom?=	robotpkg

DEPEND_USE+=		MTI-genom

DEPEND_ABI.MTI-genom?=	MTI-genom>=0.4
DEPEND_DIR.MTI-genom?=	../../localization/MTI-genom

SYSTEM_SEARCH.MTI-genom=\
	lib/pkgconfig/MTI.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
