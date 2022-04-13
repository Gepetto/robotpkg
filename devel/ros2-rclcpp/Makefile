# robotpkg Makefile for:	devel/ros2-rclcpp
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

ROS2_PKG=	rclcpp
ROS2_VERSION=	16.0.0

CATEGORIES=	devel
ROS2_COMMENT=	client Library for C++

ROS2_SUBPKGS=\
  rclcpp		\
  rclcpp_action		\
  rclcpp_components	\
  rclcpp_lifecycle

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-class-loader/depend.mk
include ../../devel/ros2-libstatistics-collector/depend.mk
include ../../interfaces/ros2-rcl-interfaces/depend.mk
include ../../sysutils/ament-index/depend.mk
include ../../mk/robotpkg.mk
