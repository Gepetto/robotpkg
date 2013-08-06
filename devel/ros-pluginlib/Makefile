# robotpkg Makefile for:	devel/ros-pluginlib
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

ROS_PKG=	pluginlib
ROS_VERSION=	1.9.20
PKGREVISION=	2

CATEGORIES=	devel
ROS_COMMENT=	tools for dynamically loading plugins
HOMEPAGE=	http://www.ros.org/wiki/ROS

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=	-DTINYXML_ROOT=${PREFIX.tinyxml}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-class-loader/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
