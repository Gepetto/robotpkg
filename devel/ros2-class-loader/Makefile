# robotpkg Makefile for:	devel/ros2-class-loader
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

ROS2_PKG=	class_loader
ROS2_VERSION=	2.2.0
ROS2_REPO=	ros

CATEGORIES=	devel
ROS2_COMMENT=	package for dynamically loading C++ classes at runtime

CONFLICTS+=	ros-class-loader-[0-9]*

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ros2-rcpputils/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/robotpkg.mk
