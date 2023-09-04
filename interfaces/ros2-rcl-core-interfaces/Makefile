# robotpkg Makefile for:	interfaces/ros2-rcl-core-interfaces
# Created:			Anthony Mallet on Thu,  7 Sep 2023
#

ROS2_PKG=	rcl_interfaces
ROS2_VERSION=	1.7.0
PKGNAME=	ros2-rcl-core-interfaces-${ROS2_VERSION}

CATEGORIES=	interfaces
ROS2_COMMENT=	core messages and services used by the ROS client libraries.

CONFLICTS+=	ros-comm-msgs-[0-9]* # same rosgraph_msgs files

# This is a split of the ros2-rcl-interface to avoid circular dependency with
# ros2-rosidl-defaults
#
ROS2_SUBPKGS=\
  builtin_interfaces		\
  service_msgs			\
  action_msgs			\
  type_description_interfaces

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../interfaces/ros2-rosidl-core/depend.mk
include ../../interfaces/ros2-test-interface-files/depend.mk
include ../../interfaces/ros2-unique-identifier-msgs/depend.mk
include ../../mk/robotpkg.mk
