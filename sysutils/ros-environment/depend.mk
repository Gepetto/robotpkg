# robotpkg depend.mk for:	sysutils/ros-environment
# Created:			Anthony Mallet on Thu,  6 Jun 2024
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_ENVIRONMENT_DEPEND_MK:=	${ROS_ENVIRONMENT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-environment
endif

ifeq (+,$(ROS_ENVIRONMENT_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-environment?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-environment?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-environment
ROS_DEPEND_USE+=	ros-environment

DEPEND_DIR.ros-environment?=	../../sysutils/ros-environment
DEPEND_ABI.ros-environment?=	ros-environment

SYSTEM_SEARCH.ros-environment=\
  'lib/pkgconfig/ros_environment.pc:/Version/s/[^0-9.]//gp'

endif # ROS_ENVIRONMENT_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
