# robotpkg depend.mk for:	math/hrp2-dynamics
# Created:			Anthony Mallet on Mon, 17 Nov 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_DYNAMICS_DEPEND_MK:=${HRP2_DYNAMICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrp2-dynamics
endif

ifeq (+,$(HRP2_DYNAMICS_DEPEND_MK)) # --------------------------------

PREFER.hrp2-dynamics?=	robotpkg

DEPEND_USE+=		hrp2-dynamics

DEPEND_ABI.hrp2-dynamics?=hrp2-dynamics>=1.5
DEPEND_DIR.hrp2-dynamics?=../../math/hrp2-dynamics

SYSTEM_SEARCH.hrp2-dynamics=\
	include/hrp2Dynamics/hrp2OptHumanoidDynamicRobot.h	\
	lib/pkgconfig/hrp2Dynamics.pc

endif # HRP2_DYNAMICS_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
