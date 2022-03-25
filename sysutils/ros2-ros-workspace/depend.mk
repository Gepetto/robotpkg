# robotpkg depend.mk for:	sysutils/ros2-ros-workspace
# Created:			Anthony Mallet on Tue, 19 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_ROS_WORKSPACE_DEPEND_MK:=	${ROS2_ROS_WORKSPACE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-ros-workspace
endif

ifeq (+,$(ROS2_ROS_WORKSPACE_DEPEND_MK)) # ---------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-ros-workspace

DEPEND_ABI.ros2-ros-workspace?=	ros2-ros-workspace>=0
DEPEND_DIR.ros2-ros-workspace?=	../../sysutils/ros2-ros-workspace

SYSTEM_SEARCH.ros2-ros-workspace=\
  $(call ros2_system_search, ros_workspace)

endif # ROS2_ROS_WORKSPACE_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
