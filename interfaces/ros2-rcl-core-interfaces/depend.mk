# robotpkg depend.mk for:	interfaces/ros2-rcl-core-interfaces
# Created:			Anthony Mallet on Thu,  7 Sep 2023
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RCL_CORE_IFACES_DEPEND_MK:=${ROS2_RCL_CORE_IFACES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rcl-core-interfaces
endif

ifeq (+,$(ROS2_RCL_CORE_IFACES_DEPEND_MK)) # -------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rcl-core-interfaces

DEPEND_ABI.ros2-rcl-core-interfaces?=ros2-rcl-core-interfaces>=1.5.0
DEPEND_DIR.ros2-rcl-core-interfaces?=../../interfaces/ros2-rcl-core-interfaces

SYSTEM_SEARCH.ros2-rcl-core-interfaces=\
  $(call ros2_system_search,	\
    action_msgs			\
    builtin_interfaces		\
    service_msgs		\
    type_description_interfaces)

endif # ROS2_RCL_CORE_IFACES_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
