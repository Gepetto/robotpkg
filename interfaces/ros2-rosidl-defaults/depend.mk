# robotpkg depend.mk for:	interfaces/ros2-rosidl-defaults
# Created:			Anthony Mallet on Thu, 21 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_ROSIDL_DEFAULTS_DEPEND_MK:=${ROS2_ROSIDL_DEFAULTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-defaults
endif

ifeq (+,$(ROS2_ROSIDL_DEFAULTS_DEPEND_MK)) # -------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rosidl-defaults

DEPEND_DIR.ros2-rosidl-defaults?=../../interfaces/ros2-rosidl-defaults
DEPEND_ABI.ros2-rosidl-defaults?=ros2-rosidl-defaults>=0

SYSTEM_SEARCH.ros2-rosidl-defaults=\
  $(call ros2_system_search,	\
    rosidl_default_generators	\
    rosidl_default_runtime)

include ../../interfaces/ros2-rosidl/depend.mk
include ../../interfaces/ros2-rosidl-python/depend.mk
include ../../interfaces/ros2-rosidl-typesupport/depend.mk
include ../../interfaces/ros2-rosidl-typesupport-fastrtps/depend.mk

endif # ROS2_ROSIDL_DEFAULTS_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
