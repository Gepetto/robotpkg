# $Id: depend.mk 2008/04/04 14:03:31 mallet $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_INTERFACE_DYNAMICS_DEPEND_MK:=${JRL_INTERFACE_DYNAMICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				jrl-interface-dynamics
endif

ifeq (+,$(JRL_INTERFACE_DYNAMICS_DEPEND_MK))
PREFER.jrl-interface-dynamics?=		robotpkg

DEPEND_USE+=				jrl-interface-dynamics

DEPEND_ABI.jrl-interface-dynamics?=	opencv>=1.0.0
DEPEND_DIR.jrl-interface-dynamics?=	../../image/opencv

DEPEND_PKG_CONFIG.jrl-interface-dynamics+=lib/pkgconfig

SYSTEM_SEARCH.jrl-interface-dynamics=\
	include/robotDynamics/jrlDynamicRobot.h		\
	lib/pkgconfig/abstractRobotDynamics.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
