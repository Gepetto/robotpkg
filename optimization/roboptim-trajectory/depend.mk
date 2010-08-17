# robotpkg depend.mk for:	optimization/roboptim-trajectory
# Created:			florent on Sat, 9 May 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROBOPTIM_TRAJECTORY_DEPEND_MK:=${ROBOPTIM_TRAJECTORY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	roboptim-trajectory
endif

ifeq (+,$(ROBOPTIM_TRAJECTORY_DEPEND_MK)) # ------------------------------

PREFER.roboptim-trajectory?=	robotpkg

DEPEND_USE+=			roboptim-trajectory

DEPEND_ABI.roboptim-trajectory?=	roboptim-trajectory>=0.4
DEPEND_DIR.roboptim-trajectory?=	../../optimization/roboptim-trajectory

SYSTEM_SEARCH.roboptim-trajectory=\
	include/roboptim/trajectory/fwd.hh		\
	'lib/pkgconfig/roboptim-trajectory.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
