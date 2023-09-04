# robotpkg Makefile for:	interfaces/ros2-rcl-interfaces
# Created:			Anthony Mallet on Tue, 5 Apr 2022
#

ROS2_PKG=	rcl_interfaces
ROS2_VERSION=	1.7.0

CATEGORIES=	interfaces
ROS2_COMMENT=	messages and services used by the ROS client libraries.

CONFLICTS+=	ros-comm-msgs-[0-9]* # same rosgraph_msgs files

# See ros2-rcl-core-interface for remaining packages (to avoid circular
# dependency with ros2-rosidl-defaults).
#
ROS2_SUBPKGS=\
  rcl_interfaces		\
  composition_interfaces	\
  lifecycle_msgs		\
  rosgraph_msgs			\
  statistics_msgs		\
  test_msgs

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../interfaces/ros2-rcl-core-interfaces/depend.mk
include ../../interfaces/ros2-rosidl-defaults/depend.mk
include ../../interfaces/ros2-test-interface-files/depend.mk
include ../../interfaces/ros2-unique-identifier-msgs/depend.mk
include ../../mk/robotpkg.mk
