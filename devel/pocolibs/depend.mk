# $LAAS: depend.mk 2008/05/25 13:11:07 tho $
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
#                                      Arnaud Degroote on Sat May 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
POCOLIBS_DEPEND_MK:=	${POCOLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pocolibs
endif

ifeq (+,$(POCOLIBS_DEPEND_MK))
PREFER.pocolibs?=	robotpkg

DEPEND_USE+=		pocolibs

DEPEND_ABI.pocolibs?=	pocolibs>=2.3
DEPEND_DIR.pocolibs?=	../../devel/pocolibs

SYSTEM_SEARCH.pocolibs=\
	bin/h2		\
	include/commonStructLib.h	\
	lib/pkgconfig/pocolibs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
