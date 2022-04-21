# robotpkg depend.mk for:	interfaces/ros2-rcl-interfaces
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RCL_INTERFACES_DEPEND_MK:=	${ROS2_RCL_INTERFACES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rcl-interfaces
endif

ifeq (+,$(ROS2_RCL_INTERFACES_DEPEND_MK)) # --------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rcl-interfaces

DEPEND_ABI.ros2-rcl-interfaces?=ros2-rcl-interfaces>=0
DEPEND_DIR.ros2-rcl-interfaces?=../../interfaces/ros2-rcl-interfaces

SYSTEM_SEARCH.ros2-rcl-interfaces=\
  $(call ros2_system_search,	\
    action_msgs			\
    builtin_interfaces		\
    composition_interfaces	\
    lifecycle_msgs		\
    rcl_interfaces		\
    rosgraph_msgs		\
    statistics_msgs		\
    test_msgs)

endif # ROS2_RCL_INTERFACES_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
