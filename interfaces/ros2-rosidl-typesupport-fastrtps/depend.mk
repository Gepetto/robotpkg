# robotpkg depend.mk for:	interfaces/ros2-rosidl-typesupport-fastrtps
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK:=	${ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-typesupport-fastrtps
endif

ifeq (+,$(ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK)) # ----------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rosidl-typesupport-fastrtps

DEPEND_DIR.ros2-rosidl-typesupport-fastrtps?=\
  ../../interfaces/ros2-rosidl-typesupport-fastrtps
DEPEND_ABI.ros2-rosidl-typesupport-fastrtps?=\
  ros2-rosidl-typesupport-fastrtps>=0

SYSTEM_SEARCH.ros2-rosidl-typesupport-fastrtps=\
  $(call ros2_system_search,			\
    fastrtps_cmake_module			\
    rosidl_typesupport_fastrtps_c		\
    rosidl_typesupport_fastrtps_cpp)

include ../../middleware/ros2-rmw/depend.mk
include ../../devel/ament-cmake-ros/depend.mk

endif # ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
