# robotpkg depend.mk for:	interfaces/ros2-common-interfaces
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_COMMON_IFACES_DEPEND_MK:=	${ROS2_COMMON_IFACES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-common-interfaces
endif

ifeq (+,$(ROS2_COMMON_IFACES_DEPEND_MK)) # ---------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-common-interfaces

DEPEND_ABI.ros2-common-interfaces?=ros2-common-interfaces>=0
DEPEND_DIR.ros2-common-interfaces?=../../interfaces/ros2-common-interfaces

SYSTEM_SEARCH.ros2-common-interfaces=\
  $(call ros2_system_search,	\
    actionlib_msgs	\
    common_interfaces	\
    diagnostic_msgs	\
    geometry_msgs	\
    nav_msgs		\
    sensor_msgs		\
    shape_msgs		\
    std_msgs		\
    std_srvs		\
    stereo_msgs		\
    trajectory_msgs	\
    visualization_msgs)

endif # ROS2_COMMON_IFACES_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
