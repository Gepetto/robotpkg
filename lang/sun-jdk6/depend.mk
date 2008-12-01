# $LAAS: depend.mk 2008/11/28 19:04:32 mallet $
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
SUN_JDK_DEPEND_MK:=	${SUN_JDK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-jdk6
endif

ifeq (+,$(SUN_JDK_DEPEND_MK))
PREFER.sun-jdk6?=	robotpkg

DEPEND_USE+=		sun-jdk6

DEPEND_ABI.sun-jdk6?=	sun-jdk6>=6.0.0
DEPEND_DIR.sun-jdk6?=	../../lang/sun-jdk6

DEPEND_METHOD.sun-jdk6?=build

SYSTEM_SEARCH.sun-jdk6=\
	bin/javac

JAVA_HOME=		${LOCALBASE}/java/sun-6
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

