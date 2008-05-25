# $LAAS: depend.mk 2008/05/25 13:02:12 tho $
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
#                                       Anthony Mallet on Thu Mar 13 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OMNIORB_DEPEND_MK:=	${OMNIORB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		omniORB
endif

ifeq (+,$(OMNIORB_DEPEND_MK))
PREFER.omniORB?=	robotpkg

DEPEND_USE+=		omniORB

DEPEND_ABI.omniORB?=	omniORB>=4.1.1
DEPEND_DIR.omniORB?=	../../devel/omniORB

SYSTEM_SEARCH.omniORB=	\
	bin/omniidl			\
	lib/pkgconfig/omniORB4.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
