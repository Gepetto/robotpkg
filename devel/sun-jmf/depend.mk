# $LAAS: depend.mk 2009/03/10 10:32:00 mallet $
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
#                                      Anthony Mallet on Fri Oct  3 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SUN_JMF_DEPEND_MK:=	${SUN_JMF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-jmf
endif

ifeq (+,$(SUN_JMF_DEPEND_MK)) # --------------------------------------

PREFER.sun-jmf?=	robotpkg

DEPEND_USE+=		sun-jmf

DEPEND_ABI.sun-jmf?=	sun-jmf>=2.1.1e
DEPEND_DIR.sun-jmf?=	../../devel/sun-jmf

SYSTEM_SEARCH.sun-jmf=\
	'{,java/sun-6/}lib/ext/jmf.jar'

endif # --- SUN_JMF_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

