# $LAAS: depend.mk 2008/10/06 15:25:32 mallet $
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
#                                      Anthony Mallet on Fri Oct  3 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JYTHON_DEPEND_MK:=	${JYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jython
endif

ifeq (+,$(JYTHON_DEPEND_MK)) # ---------------------------------------

PREFER.jython?=		robotpkg

DEPEND_USE+=		jython

DEPEND_ABI.jython?=	jython>=2.2.1
DEPEND_DIR.jython?=	../../lang/jython

SYSTEM_SEARCH.jython=\
	bin/jython

JYTHON_HOME=		${LOCALBASE}/java/jython

endif # --- SUN_JYTHON_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

