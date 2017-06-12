# robotpkg depend.mk for:	graphics/robot_capsule_urdf
# Created:			Olivier Stasse on Wed, 19 Jun 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROBOT_CAPSULE_URDF_DEPEND_MK:=	${ROBOT_CAPSULE_URDF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			robot-capsule-urdf
endif

ifeq (+,$(ROBOT_CAPSULE_URDF_DEPEND_MK)) # ---------------------------------

PREFER.robot-capsule-urdf?=	robotpkg

SYSTEM_SEARCH.robot-capsule-urdf=\
  'lib/pkgconfig/robot_capsule_urdf.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			robot-capsule-urdf

DEPEND_ABI.robot-capsule-urdf?=	robot-capsule-urdf>=1.0
DEPEND_DIR.robot-capsule-urdf?=	../../graphics/robot-capsule-urdf

endif # ROBOT_CAPSULE_URDF_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
