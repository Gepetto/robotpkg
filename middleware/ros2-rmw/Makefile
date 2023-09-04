# robotpkg Makefile for:	middleware/ros2-rmw
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

ROS2_PKG=	rmw
ROS2_VERSION=	7.2.1

CATEGORIES=	middleware
ROS2_COMMENT=	middleware interface.

ROS2_SUBPKGS=\
  rmw				\
  rmw_implementation_cmake

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcutils/depend.mk
include ../../interfaces/ros2-rosidl/depend.mk
include ../../interfaces/ros2-rosidl-dynamic-typesupport/depend.mk
include ../../mk/robotpkg.mk
