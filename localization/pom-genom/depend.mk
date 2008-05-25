# $LAAS: depend.mk 2008/05/25 14:22:52 tho $
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
#                                       Anthony Mallet on Fri Mar 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
POMGENOM_DEPEND_MK:=	${POMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pom-genom
endif

ifeq (+,$(POMGENOM_DEPEND_MK))
PREFER.pom-genom?=	robotpkg

DEPEND_USE+=		pom-genom

DEPEND_ABI.pom-genom?=	pom-genom>=0.5
DEPEND_DIR.pom-genom?=	../../localization/pom-genom

SYSTEM_SEARCH.pom-genom=\
	include/pom/pomStruct.h		\
	lib/pkgconfig/pom.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
