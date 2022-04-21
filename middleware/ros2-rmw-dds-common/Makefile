# robotpkg Makefile for:	middleware/ros2-rmw-dds-common
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

ROS2_PKG=	rmw_dds_common
ROS2_VERSION=	1.6.0

CATEGORIES=	middleware
ROS2_COMMENT=	C++ utilities for DDS-based middlewares

include ../../meta-pkgs/ros2-core/Makefile.common

CONFIGURE_DIRS= ${ROS2_PKG}

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcpputils/depend.mk
include ../../interfaces/ros2-rosidl-defaults/depend.mk
include ../../interfaces/ros2-rosidl-typesupport/depend.mk
include ../../middleware/ros2-rmw/depend.mk
include ../../mk/robotpkg.mk
