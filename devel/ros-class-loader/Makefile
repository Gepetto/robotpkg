# robotpkg Makefile for:	devel/ros-class-loader
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

ROS_PKG=	class_loader
ROS_VERSION=	0.3.0

CATEGORIES=	devel
ROS_COMMENT=	package for dynamically loading C++ classes at runtime

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=	-DPoco_INCLUDE_DIR=${PREFIX.poco}/include
CMAKE_ARGS+=	-DPoco_LIBRARY_DIR=${PREFIX.poco}/lib
CMAKE_ARGS+=	-DPoco_LIBRARIES=$(filter %.so,${SYSTEM_FILES.poco})

LIBRARY_DIRS.poco+=	lib
RPATH_DIRS.poco+=	lib

include ../../devel/ros-catkin/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/sysdep/poco.mk
include ../../mk/robotpkg.mk
