# robotpkg Makefile for:	devel/ros2-rcl-logging
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

ROS2_PKG=	rcl_logging
ROS2_VERSION=	2.3.0

CATEGORIES=	devel
ROS2_COMMENT=	logging implementations.

ROS2_SUBPKGS=\
  rcl_logging_interface	\
  rcl_logging_noop	\
  rcl_logging_spdlog

include ../../meta-pkgs/ros2-core/Makefile.common

DEPEND_ABI.spdlog+=	spdlog>=1.5.0

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcpputils/depend.mk
include ../../devel/ros2-rcutils/depend.mk
include ../../devel/spdlog/depend.mk
include ../../mk/robotpkg.mk
