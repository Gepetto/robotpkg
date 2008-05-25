# $LAAS: depend.mk 2008/05/25 15:45:19 tho $
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
RFLEXCLIENTS_DEPEND_MK:=${RFLEXCLIENTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rflexclients
endif

ifeq (+,$(RFLEXCLIENTS_DEPEND_MK))
PREFER.rflexclients?=	robotpkg

DEPEND_USE+=		rflexclients

DEPEND_ABI.rflexclients?=	rflexclients>=1.0.1
DEPEND_DIR.rflexclients?=	../../robots/rflexclients

SYSTEM_SEARCH.rflexclients=\
	bin/rflexComm \
	include/rflexclients/rFlex.h \
	lib/pkgconfig/rflexclients.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
