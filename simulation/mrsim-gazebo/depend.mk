# robotpkg depend.mk for:	simulation/mrsim-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MRSIM_GAZEBO_DEPEND_MK:=${MRSIM_GAZEBO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mrsim-gazebo
endif

ifeq (+,$(MRSIM_GAZEBO_DEPEND_MK)) # ---------------------------------------

PREFER.mrsim-gazebo?=	robotpkg

SYSTEM_SEARCH.mrsim-gazebo=\
  'lib/gazebo/mrsim-gazebo.so'					\
  'lib/pkgconfig/mrsim-gazebo.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		mrsim-gazebo

DEPEND_ABI.mrsim-gazebo?=	mrsim-gazebo>=1.0
DEPEND_DIR.mrsim-gazebo?=	../../simulation/mrsim-gazebo

endif # MRSIM_GAZEBO_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
