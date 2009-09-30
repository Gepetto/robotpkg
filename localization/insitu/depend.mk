# $LAAS: depend.mk 2009/09/30 12:16:01 mallet $
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
#                                       Anthony Mallet on Mon May 19 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
INSITU_DEPEND_MK:=	${INSITU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		insitu
endif

ifeq (+,$(INSITU_DEPEND_MK)) # ---------------------------------------

PREFER.insitu?=		robotpkg

DEPEND_USE+=		insitu

DEPEND_ABI.insitu?=	insitu>=1.3
DEPEND_DIR.insitu?=	../../localization/insitu

SYSTEM_SEARCH.insitu=\
	include/insitu/lib.h	\
	lib/pkgconfig/insitu.pc

endif # --------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
