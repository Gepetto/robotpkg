# $LAAS: depend.mk 2009/03/10 10:11:28 mallet $
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
SUN_JRE_DEPEND_MK:=	${SUN_JRE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-jre6
endif

ifeq (+,$(SUN_JRE_DEPEND_MK))
PREFER.sun-jre6?=	robotpkg

DEPEND_USE+=		sun-jre6

DEPEND_ABI.sun-jre6?=	sun-jre6>=6.0.0
DEPEND_DIR.sun-jre6?=	../../lang/sun-jre6

SYSTEM_SEARCH.sun-jre6=\
	'bin/java{,-sun6}'

JAVA_HOME=		${LOCALBASE}/java/sun-6
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

