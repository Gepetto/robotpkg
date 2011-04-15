# robotpkg depend.mk for:	math/jrl-dynamics
# Created:			Anthony Mallet on Mon, 13 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_DYNAMICS_DEPEND_MK:=${JRL_DYNAMICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-dynamics
endif

ifeq (+,$(JRL_DYNAMICS_DEPEND_MK)) # ---------------------------------

PREFER.jrl-dynamics?=	robotpkg

DEPEND_USE+=		jrl-dynamics

DEPEND_ABI.jrl-dynamics?=jrl-dynamics>=1.17
DEPEND_DIR.jrl-dynamics?=../../math/jrl-dynamics

SYSTEM_SEARCH.jrl-dynamics=\
	include/jrl/dynamics/dynamicrobot.hh	\
	lib/pkgconfig/jrl-dynamics.pc

endif # JRL_DYNAMICS_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

