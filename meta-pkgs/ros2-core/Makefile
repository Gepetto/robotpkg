# robotpkg Makefile for:	meta-pkgs/ros2-core
# Created:			Anthony Mallet on Tue,  5 Apr 2022
#

PKGNAME=		ros2-core-${ROS2_VERSION}
ROS2_PKG=		variants
ROS2_VERSION=		0.9.3

CATEGORIES=		meta-pkgs
COMMENT=		The Robotic Operating System 2 - core concepts.

include ../../meta-pkgs/ros2-core/Makefile.common

CONFIGURE_DIRS=		ros_core

include ../../devel/ament-cmake/depend.mk
include ../../mk/robotpkg.mk
