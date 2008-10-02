# $LAAS: depend.mk 2008/10/02 12:18:59 mallet $
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
#                                       Anthony Mallet on Thu Oct  2 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TVMET_DEPEND_MK:=	${TVMET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tvmet
endif

ifeq (+,$(TVMET_DEPEND_MK)) # ----------------------------------------

PREFER.tvmet?=		robotpkg

DEPEND_USE+=		tvmet

DEPEND_ABI.tvmet?=	tvmet>=1.7.2
DEPEND_DIR.tvmet?=	../../math/tvmet

SYSTEM_SEARCH.tvmet=\
	bin/tvmet-config	\
	include/tvmet/tvmet.h

endif # TVMET_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
