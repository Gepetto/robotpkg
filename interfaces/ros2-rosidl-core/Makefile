# robotpkg Makefile for:	interfaces/ros2-rosidl-core
# Created:			Anthony Mallet on Thu,  7 Sep 2023
#

ROS2_PKG=	rosidl_core
ROS2_VERSION=	0.2.0

CATEGORIES=	interfaces
ROS2_COMMENT=	runtime and generators dependencies for messages

ROS2_SUBPKGS=\
  rosidl_core_generators	\
  rosidl_core_runtime

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../interfaces/ros2-rosidl/depend.mk
include ../../interfaces/ros2-rosidl-python/depend.mk
include ../../interfaces/ros2-rosidl-typesupport/depend.mk
include ../../interfaces/ros2-rosidl-typesupport-fastrtps/depend.mk
include ../../mk/robotpkg.mk
