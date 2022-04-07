# robotpkg Makefile for:	middleware/ros2-rmw-implementation
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

ROS2_PKG=	rmw_implementation
ROS2_VERSION=	2.8.1

CATEGORIES=	middleware
ROS2_COMMENT=	CMake infrastructure and dependencies for middlewares.

ROS2_SUBPKGS=\
  rmw_implementation		\
  test_rmw_implementation

include ../../meta-pkgs/ros2-core/Makefile.common

CONFIGURE_ENV+=\
  RMW_IMPLEMENTATIONS=rmw_fastrtps_cpp:rmw_fastrtps_dynamic_cpp

include ../../middleware/ros2-rmw/depend.mk
include ../../middleware/ros2-rmw-fastrtps/depend.mk
include ../../sysutils/ament-index/depend.mk
include ../../mk/robotpkg.mk
