# robotpkg Makefile for:	sysutils/ros2-ros-workspace
# Created:			Anthony Mallet on Tue, 19 Apr 2022
#

ROS2_PKG=	ros_workspace
ROS2_VERSION=	1.0.2

CATEGORIES=	sysutils
ROS2_COMMENT=	environment files for packages.

# avoid circular dependency on ourself
ROS2_AMENTPKG=	no

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ament-cmake/depend.mk
include ../../mk/robotpkg.mk
