#
# Copyright (c) 2009-2010 LAAS/CNRS
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
#                                       Anthony Mallet on Tue Oct 27 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPOM_DEPEND_MK:=	${LIBPOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libpom
endif

ifeq (+,$(LIBPOM_DEPEND_MK)) # ---------------------------------------------

PREFER.libpom?=		robotpkg

DEPEND_USE+=		libpom

DEPEND_ABI.libpom?=	libpom>=1.2
DEPEND_DIR.libpom?=	../../localization/libpom

SYSTEM_SEARCH.libpom=\
	include/libpom/lib.h	\
	'lib/pkgconfig/libpom.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
