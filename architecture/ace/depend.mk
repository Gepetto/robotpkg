# $LAAS: depend.mk 2009/03/17 22:00:13 tho $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                      Anthony Mallet on Sun Jun  1 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ACE_DEPEND_MK:=		${ACE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ace
endif

ifeq (+,$(ACE_DEPEND_MK)) # ------------------------------------------

PREFER.ace?=		robotpkg

DEPEND_USE+=		ace

DEPEND_ABI.ace?=	ace>=5.6
DEPEND_DIR.ace?=	../../architecture/ace

SYSTEM_SEARCH.ace=\
	include/ace/ACE.h					\
	'include/ace/Version.h:/ACE_VERSION/s/[^0-9.]//gp'	\
	'lib/libACE.{a,so}'					\
	'lib/pkgconfig/ACE.pc:/Version/s/[^0-9.]//gp'

endif # ACE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

