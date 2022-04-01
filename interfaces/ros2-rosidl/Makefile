# robotpkg Makefile for:	interfaces/ros2-rosidl
# Created:			Anthony Mallet on Fri, 1 Apr 2022
#

ROS2_PKG=	rosidl
ROS2_VERSION=	3.1.1

CATEGORIES=	interfaces
ROS2_COMMENT=	API and scripts to manipulate .msg/.srv/.action files.

ROS2_SUBPKGS=\
    rosidl_adapter				\
    rosidl_cmake				\
    rosidl_typesupport_interface		\
    rosidl_runtime_c				\
    rosidl_generator_c				\
    rosidl_generator_cpp			\
    rosidl_parser				\
    rosidl_runtime_cpp				\
    rosidl_typesupport_introspection_c		\
    rosidl_typesupport_introspection_cpp	\
    rosidl_typesupport_introspection_tests	\
  python:					\
    rosidl_cli

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcutils/depend.mk
include ../../mk/sysdep/py-lark-parser.mk
include ../../mk/robotpkg.mk
