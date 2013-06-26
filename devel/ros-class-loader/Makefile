# robotpkg Makefile for:	devel/ros-class-loader
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

ROS_PKG=	class_loader
ROS_VERSION=	0.1.29

CATEGORIES=	devel
ROS_COMMENT=	package for dynamically loading C++ classes at runtime

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=		-DPOCO_ROOT=${PREFIX.poco}
LIBRARY_DIRS.poco+=	lib
RPATH_DIRS.poco+=	lib

include ../../devel/ros-catkin/depend.mk
include ../../sysutils/ros-console-bridge/depend.mk
include ../../mk/sysdep/poco.mk
include ../../mk/robotpkg.mk
