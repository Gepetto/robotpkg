# robotpkg depend.mk for:	simulation/dxsim-gazebo
# Created:			Anthony Mallet on Thu, 20 Jul 2023
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DXSIM_GAZEBO_DEPEND_MK:=${DXSIM_GAZEBO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dxsim-gazebo
endif

ifeq (+,$(DXSIM_GAZEBO_DEPEND_MK)) # ---------------------------------------

PREFER.dxsim-gazebo?=	robotpkg

SYSTEM_SEARCH.dxsim-gazebo=\
  'lib/gazebo/dxsim-gazebo.so'					\
  'lib/pkgconfig/dxsim-gazebo.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		dxsim-gazebo

DEPEND_ABI.dxsim-gazebo?=	dxsim-gazebo>=1.0
DEPEND_DIR.dxsim-gazebo?=	../../simulation/dxsim-gazebo

endif # DXSIM_GAZEBO_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
