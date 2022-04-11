# robotpkg Makefile for:	interfaces/ros2-rosidl-typesupport
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

ROS2_PKG=	rosidl_typesupport
ROS2_VERSION=	2.0.0

CATEGORIES=	interfaces
ROS2_COMMENT=	typesupport for messages and services

ROS2_SUBPKGS=\
  rosidl_typesupport_c		\
  rosidl_typesupport_cpp

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcpputils/depend.mk
include ../../interfaces/ros2-rosidl/depend.mk
include ../../mk/robotpkg.mk
