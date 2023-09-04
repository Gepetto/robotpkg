# robotpkg depend.mk for:	interfaces/ros2-rosidl-typesupport
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS2_ROSIDL_TYPESUPPORT_DEPEND_MK:=	${ROS2_ROSIDL_TYPESUPPORT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros2-rosidl-typesupport
endif

ifeq (+,$(ROS2_ROSIDL_TYPESUPPORT_DEPEND_MK)) # ----------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=			ros2-rosidl-typesupport

DEPEND_DIR.ros2-rosidl-typesupport?=	../../interfaces/ros2-rosidl-typesupport
DEPEND_ABI.ros2-rosidl-typesupport?=	ros2-rosidl-typesupport>=0

SYSTEM_SEARCH.ros2-rosidl-typesupport=\
  $(call ros2_system_search,			\
    rosidl_typesupport_c					\
    rosidl_typesupport_cpp)					\
  '${PYTHON_SITELIB}/rosidl_typesupport_c/__init__.py'		\
  '${PYTHON_SITELIB}/rosidl_typesupport_cpp/__init__.py'

include ../../interfaces/ros2-rosidl/depend.mk
include ../../mk/sysdep/python.mk

# this needs AMENT_PREFIX_PATH at configure runtime
AMENT_PREFIX_PATH.ros2-rosidl-typesupport=${PREFIX.ros2-rosidl-typesupport}

endif # ROS2_ROSIDL_TYPESUPPORT_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
