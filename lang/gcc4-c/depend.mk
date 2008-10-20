# $LAAS: depend.mk 2008/10/19 19:24:33 tho $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Anthony Mallet on Fri Oct 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC4_C_DEPEND_MK:=	${GCC4_C_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gcc4-c
endif

ifeq (+,$(GCC4_C_DEPEND_MK)) # ---------------------------------------

PREFER.gcc4-c?=		system

DEPEND_USE+=		gcc4-c

DEPEND_ABI.gcc4-c?=	gcc4-c>=4.2.0
DEPEND_DIR.gcc4-c?=	../../lang/gcc4-c

SYSTEM_SEARCH.gcc4-c=	\
	"bin/gcc::% -dumpversion"

include ../../mk/robotpkg.prefs.mk

ifeq (robotpkg,${PREFER.gcc4-c})
  CC:=			${LOCALBASE}/gcc42/bin/gcc
  CPP:=			${LOCALBASE}/gcc42/bin/cpp
endif

endif # GCC4_C_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
