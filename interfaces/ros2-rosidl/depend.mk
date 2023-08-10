# robotpkg depend.mk for:	interfaces/ros2-rosidl
# Created:			Anthony Mallet on Fri, 1 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2_ROSIDL_DEPEND_MK:=	${ROS2_ROSIDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2-rosidl
endif

ifeq (+,$(ROS2_ROSIDL_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-rosidl

DEPEND_DIR.ros2-rosidl?=../../interfaces/ros2-rosidl
DEPEND_ABI.ros2-rosidl?=ros2-rosidl>=0

SYSTEM_SEARCH.ros2-rosidl=\
  $(call ros2_system_search,			\
    rosidl_adapter				\
    rosidl_cmake				\
    rosidl_generator_c				\
    rosidl_generator_cpp			\
    rosidl_parser				\
    rosidl_runtime_c				\
    rosidl_runtime_cpp				\
    rosidl_typesupport_interface		\
    rosidl_typesupport_introspection_c		\
    rosidl_typesupport_introspection_cpp)	\
  '${PYTHON_SITELIB}/rosidl_cli/__init__.py'

include ../../mk/sysdep/python.mk

endif # ROS2_ROSIDL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
