# $LAAS: depend.mk 2009/02/02 16:36:09 mallet $
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
#                                      Anthony Mallet on Mon Nov 17 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_DYNAMICS_DEPEND_MK:=${HRP2_DYNAMICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrp2-dynamics
endif

ifeq (+,$(HRP2_DYNAMICS_DEPEND_MK)) # --------------------------------

PREFER.hrp2-dynamics?=	robotpkg

DEPEND_USE+=		hrp2-dynamics

DEPEND_ABI.hrp2-dynamics?=hrp2-dynamics>=1.0
DEPEND_DIR.hrp2-dynamics?=../../math/hrp2-dynamics

SYSTEM_SEARCH.hrp2-dynamics=\
	include/hrp2Dynamics/hrp2OptHumanoidDynamicRobot.h	\
	lib/pkgconfig/hrp2Dynamics.pc

endif # HRP2_DYNAMICS_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
