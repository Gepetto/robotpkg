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
#                                   Séverin Lemaignan on Fri May 28 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BLENDER_DEPEND_MK:=	${BLENDER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		blender
endif

ifeq (+,$(BLENDER_DEPEND_MK)) # -------------------------------------

PREFER.blender?=	system
DEPEND_USE+=		blender
DEPEND_ABI.blender?=	blender>=2.492<2.500

SYSTEM_SEARCH.blender=	\
	'bin/blender:/Blender/{s/[^.0-9]//gp;q;}:% --version'

SYSTEM_PKG.Linux.blender=blender

export BLENDER=	${PREFIX.blender}/bin/blender

endif # BLENDER_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
