# $LAAS: depend.mk 2009/02/04 15:57:28 mallet $
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
#                                      Anthony Mallet on Sun May 25 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM_OPENHRP_DEPEND_MK:=${GENOM_OPENHRP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom-openhrp-plugin
endif

ifeq (+,$(GENOM_OPENHRP_DEPEND_MK)) # --------------------------------

PREFER.genom-openhrp-plugin?=	robotpkg

DEPEND_USE+=		genom-openhrp-plugin

DEPEND_ABI.genom-openhrp-plugin?=genom-openhrp-plugin>=1.4
DEPEND_DIR.genom-openhrp-plugin?=../../architecture/genom-openhrp-plugin

SYSTEM_SEARCH.genom-openhrp-plugin=\
	include/genom-openhrp/genom-hrp2.h	\
	'lib/pkgconfig/genom-openhrp-plugin.pc:/Version:/s/[^0-9.]*//p'

endif # GENOM_OPENHRP_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
