# robotpkg Makefile for:	devel/ros-pluginlib
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

ROS_PKG=	pluginlib
ROS_VERSION=	1.10.1

CATEGORIES=	devel
ROS_COMMENT=	tools for dynamically loading plugins
HOMEPAGE=	http://www.ros.org/wiki/ROS

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=	-DTinyXML_INCLUDE_PATH=${PREFIX.tinyxml}/include
CMAKE_ARGS+=	-DTinyXML_LIBRARY_PATH=${PREFIX.tinyxml}/lib

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-class-loader/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
