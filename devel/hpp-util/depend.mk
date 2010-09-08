# $LAAS: depend.mk 2010/08/09 18:18:08 tmoulard $
#
# Copyright (c) 2010 LAAS/CNRS
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
#                                      Thomas Moulard on Wed Sep 08 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPUTIL_DEPEND_MK:=	${HPPUTIL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-util
endif

ifeq (+,$(HPPUTIL_DEPEND_MK)) # ---------------------------

PREFER.hpp-util?=	robotpkg

DEPEND_USE+=		hpp-util

DEPEND_ABI.hpp-util?=	hpp-util>=0.3
DEPEND_DIR.hpp-util?=	../../devel/hpp-util

SYSTEM_SEARCH.hpp-util=			\
	include/hpp/util/debug.hh	\
	lib/libhpp-util.so		\
	'lib/pkgconfig/hpp-util.pc:/Version/s/[^0-9]//gp'

endif # HPPUTIL_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
