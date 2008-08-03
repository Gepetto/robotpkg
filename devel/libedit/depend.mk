# $LAAS: depend.mk 2008/08/03 16:30:13 tho $
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
#                                      Anthony Mallet on Sun Aug  3 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBEDIT_DEPEND_MK:=	${LIBEDIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libedit
endif

ifeq (+,$(LIBEDIT_DEPEND_MK)) # --------------------------------------

PREFER.libedit?=	robotpkg

DEPEND_USE+=		libedit

DEPEND_ABI.libedit?=	libedit>=2.10
DEPEND_DIR.libedit?=	../../devel/libedit

SYSTEM_SEARCH.libedit=\
	include/histedit.h	\
	lib/libedit.*

endif # LIBEDIT_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
