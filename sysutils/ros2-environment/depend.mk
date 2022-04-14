# robotpkg depend.mk for:	sysutils/ros2-environment
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_ENVIRONMENT_DEPEND_MK:=	${ROS2_ENVIRONMENT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-environment
endif

ifeq (+,$(ROS2_ENVIRONMENT_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-environment

DEPEND_ABI.ros2-environment?=	ros2-environment>=2
DEPEND_DIR.ros2-environment?=	../../sysutils/ros2-environment

SYSTEM_SEARCH.ros2-environment=\
  $(call ros2_system_search, ros_environment)

endif # ROS2_ENVIRONMENT_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
