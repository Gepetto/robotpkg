# robotpkg depend.mk for:	interfaces/abstract-robot-dynamics
# Created:			Anthony Mallet on Fri, 4 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_INTERFACE_DYNAMICS_DEPEND_MK:=${JRL_INTERFACE_DYNAMICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				abstract-robot-dynamics
endif

ifeq (+,$(JRL_INTERFACE_DYNAMICS_DEPEND_MK))
PREFER.abstract-robot-dynamics?=		robotpkg

DEPEND_USE+=				abstract-robot-dynamics

DEPEND_ABI.abstract-robot-dynamics?=	abstract-robot-dynamics>=1.16
DEPEND_DIR.abstract-robot-dynamics?=	../../interfaces/abstract-robot-dynamics

SYSTEM_SEARCH.abstract-robot-dynamics=\
	include/abstract-robot-dynamics/dynamic-robot.hh	\
	lib/pkgconfig/abstract-robot-dynamics.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
