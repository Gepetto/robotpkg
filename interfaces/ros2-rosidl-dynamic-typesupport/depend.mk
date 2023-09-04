# robotpkg depend.mk for:	interfaces/ros2-rosidl-dynamic-typesupport
# Created:			Anthony Mallet on Thu,  7 Sep 2023
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_ROSIDL_DYNTS_DEPEND_MK:=	${ROS2_ROSIDL_DYNTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-dynamic-typesupport
endif

ifeq (+,$(ROS2_ROSIDL_DYNTS_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rosidl-dynamic-typesupport

DEPEND_DIR.ros2-rosidl-dynamic-typesupport?=\
  ../../interfaces/ros2-rosidl-dynamic-typesupport
DEPEND_ABI.ros2-rosidl-dynamic-typesupport?=\
  ros2-rosidl-dynamic-typesupport>=0

SYSTEM_SEARCH.ros2-rosidl-dynamic-typesupport=\
  $(call ros2_system_search,			\
    rosidl_dynamic_typesupport)

include ../../interfaces/ros2-rosidl/depend.mk

endif # ROS2_ROSIDL_DYNTS_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
