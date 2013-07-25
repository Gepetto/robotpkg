# robotpkg depend.mk for:	math/ros-angles
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_ANGLES_DEPEND_MK:=	${ROS_ANGLES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-angles
endif

ifeq (+,$(ROS_ANGLES_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-angles?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-angles?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-angles
ROS_DEPEND_USE+=		ros-angles

DEPEND_ABI.ros+=		ros>=groovy

DEPEND_ABI.ros-angles?=		ros-angles>=1.9
DEPEND_DIR.ros-angles?=		../../math/ros-angles

SYSTEM_SEARCH.ros-angles=\
  'include/angles/angles.h'					\
  'share/angles/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/angles.pc:/Version/s/[^0-9.]//gp'

endif # ROS_ANGLES_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
