# $LAAS: depend.mk 2009/03/10 10:27:50 mallet $
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
SUN_JAVA3D_DEPEND_MK:=	${SUN_JAVA3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-java3d
endif

ifeq (+,$(SUN_JAVA3D_DEPEND_MK)) # -----------------------------------

PREFER.sun-java3d?=	robotpkg

DEPEND_USE+=		sun-java3d

DEPEND_ABI.sun-java3d?=	sun-java3d>=1.5.1
DEPEND_DIR.sun-java3d?=	../../devel/sun-java3d

SYSTEM_SEARCH.sun-java3d=\
	'{,java/sun-6/}lib/ext/j3dcore.jar'

endif # --- SUN_JAVA3D_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

