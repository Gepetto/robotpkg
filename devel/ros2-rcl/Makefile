# robotpkg Makefile for:	devel/ros2-rcl
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

ROS2_PKG=	rcl
ROS2_VERSION=	5.3.0

CATEGORIES=	devel
ROS2_COMMENT=	support for language specific ROS Client Libraries.

ROS2_SUBPKGS=\
  rcl_yaml_param_parser		\
  rcl				\
  rcl_action			\
  rcl_lifecycle

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcl-logging/depend.mk
include ../../interfaces/ros2-rcl-interfaces/depend.mk
include ../../middleware/ros2-rmw/depend.mk
include ../../middleware/ros2-rmw-implementation/depend.mk
include ../../mk/sysdep/libyaml.mk
include ../../mk/robotpkg.mk
