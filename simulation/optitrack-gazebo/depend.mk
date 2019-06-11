# robotpkg depend.mk for:	simulation/optitrack-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPTITRACK_GAZEBO_DEPEND_MK:=	${OPTITRACK_GAZEBO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			optitrack-gazebo
endif

ifeq (+,$(OPTITRACK_GAZEBO_DEPEND_MK)) # -----------------------------------

PREFER.optitrack-gazebo?=	robotpkg

SYSTEM_SEARCH.optitrack-gazebo=\
  'lib/gazebo/optitrack-gazebo.so'					\
  'lib/pkgconfig/optitrack-gazebo.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			optitrack-gazebo

DEPEND_ABI.optitrack-gazebo?=	optitrack-gazebo>=1.0
DEPEND_DIR.optitrack-gazebo?=	../../simulation/optitrack-gazebo

endif # OPTITRACK_GAZEBO_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
