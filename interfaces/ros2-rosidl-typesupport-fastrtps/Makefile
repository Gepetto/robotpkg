# robotpkg Makefile for:	interfaces/ros2-rosidl-typesupport-fastrtps
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

ROS2_PKG=	rosidl_typesupport_fastrtps
ROS2_VERSION=	2.2.0

CATEGORIES=	interfaces
ROS2_COMMENT=	typesupport for fastrtps

ROS2_SUBPKGS=\
  fastrtps_cmake_module			\
  rosidl_typesupport_fastrtps_c		\
  rosidl_typesupport_fastrtps_cpp

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../interfaces/ros2-rosidl/depend.mk
include ../../middleware/fastcdr/depend.mk
include ../../middleware/ros2-rmw/depend.mk
include ../../mk/robotpkg.mk
