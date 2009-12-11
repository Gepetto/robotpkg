# $LAAS: patch.mk 2009/12/11 21:58:15 tho $
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
#                                      Anthony Mallet on Wed Jan 14 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PATCH_DEPEND_MK:=	${PATCH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		patch
endif

ifeq (+,$(PATCH_DEPEND_MK)) # ----------------------------------------------

PREFER.patch?=		system

DEPEND_USE+=		patch
DEPEND_ABI.patch?=	patch>=2.0
DEPEND_METHOD.patch?=	build
SYSTEM_SEARCH.patch=	'bin/patch:/[Pp]atch/s/[^0-9.]//gp:% -v'

export PATCH=		$(word 1,${SYSTEM_FILES.patch})

endif # PATCH_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
