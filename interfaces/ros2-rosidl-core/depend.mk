# robotpkg depend.mk for:	interfaces/ros2-rosidl-core
# Created:			Anthony Mallet on Thu,  7 Sep 2023
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_ROSIDL_CORE_DEPEND_MK:=	${ROS2_ROSIDL_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-core
endif

ifeq (+,$(ROS2_ROSIDL_CORE_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rosidl-core

DEPEND_DIR.ros2-rosidl-core?=	../../interfaces/ros2-rosidl-core
DEPEND_ABI.ros2-rosidl-core?=	ros2-rosidl-core>=0

SYSTEM_SEARCH.ros2-rosidl-core=\
  $(call ros2_system_search,	\
    rosidl_core_generators	\
    rosidl_core_runtime)

include ../../interfaces/ros2-rosidl/depend.mk
include ../../interfaces/ros2-rosidl-python/depend.mk
include ../../interfaces/ros2-rosidl-typesupport/depend.mk
include ../../interfaces/ros2-rosidl-typesupport-fastrtps/depend.mk

endif # ROS2_ROSIDL_CORE_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
