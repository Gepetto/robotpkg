# $LAAS: depend.mk 2008/06/17 18:18:13 mallet $
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
#                                      Arnaud Degroote on Tue May 20 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MTI_DEPEND_MK:=${MTI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		MTI
endif

ifeq (+,$(MTI_DEPEND_MK))
PREFER.MTI?=	robotpkg

DEPEND_USE+=		MTI

DEPEND_ABI.MTI?=	MTI>=0.3
DEPEND_DIR.MTI?=	../../hardware/MTI

SYSTEM_SEARCH.MTI=\
	include/MTI-clients/MTI.h \
	lib/pkgconfig/MTI-clients.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
