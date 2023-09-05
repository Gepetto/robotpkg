# robotpkg depend.mk for:	interfaces/ros2-rosidl-dynamic-typesupport-fastrtps
# Created:			Anthony Mallet on Thu,  7 Sep 2023
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS2_ROSIDL_DYNTSFASTRTPS_DEPEND_MK:=	${ROS2_ROSIDL_DYNTSFASTRTPS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-dynamic-typesupport-fastrtps
endif

ifeq (+,$(ROS2_ROSIDL_DYNTSFASTRTPS_DEPEND_MK)) # --------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rosidl-dynamic-typesupport-fastrtps

DEPEND_DIR.ros2-rosidl-dynamic-typesupport-fastrtps?=\
  ../../interfaces/ros2-rosidl-dynamic-typesupport-fastrtps
DEPEND_ABI.ros2-rosidl-dynamic-typesupport-fastrtps?=\
  ros2-rosidl-dynamic-typesupport-fastrtps>=0

SYSTEM_SEARCH.ros2-rosidl-dynamic-typesupport-fastrtps=\
  $(call ros2_system_search,			\
    rosidl_dynamic_typesupport_fastrtps)

endif # ROS2_ROSIDL_DYNTSFASTRTPS_DEPEND_MK --------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
