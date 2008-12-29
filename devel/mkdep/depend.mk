# $LAAS: depend.mk 2008/12/29 16:18:12 tho $
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
#                                      Anthony Mallet on Mon Dec 29 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MKDEP_DEPEND_MK:=	${MKDEP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mkdep
endif

ifeq (+,$(MKDEP_DEPEND_MK)) # ----------------------------------------------

PREFER.mkdep?=	robotpkg

DEPEND_USE+=		mkdep

DEPEND_ABI.mkdep?=	mkdep>=2.6
DEPEND_DIR.mkdep?=	../../devel/mkdep
DEPEND_METHOD.mkdep?=	build

SYSTEM_SEARCH.mkdep=\
	bin/mkdep						\
	'lib/pkgconfig/mkdep.pc:/Version/s/[^.0-9]//gp'

endif # MKDEP_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
