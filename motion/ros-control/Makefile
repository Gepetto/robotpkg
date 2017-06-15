# robotpkg Makefile for:	motion/ros-control
# Created:			Anthony Mallet on Fri, 31 Mar 2017
#

PKGREVISION=	2
PKGNAME=	ros-control-${ROS_VERSION}
ROS_PKG=	ros_control
ROS_VERSION=	0.9.4
ROS_REPO=	ros-controls
ROS_METAPKG=	yes

CATEGORIES=	motion
ROS_COMMENT=	generic control loop feedback mechanism
HOMEPAGE=	http://wiki.ros.org/ros_control

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=	-DTinyXML_INCLUDE_PATH=${PREFIX.tinyxml}/include
CMAKE_ARGS+=	-DTinyXML_LIBRARY_PATH=${PREFIX.tinyxml}/lib

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-realtime-tools/depend.mk
include ../../graphics/ros-rqt/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../motion/ros-control-toolbox/depend.mk
include ../../net/ros-resource-retriever/depend.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
