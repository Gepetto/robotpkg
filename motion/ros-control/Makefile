# robotpkg Makefile for:	motion/ros-control
# Created:			Anthony Mallet on Fri, 31 Mar 2017
#

PKGNAME=	ros-control-${ROS_VERSION}
ROS_PKG=	ros_control
ROS_VERSION=	0.17.0
ROS_REPO=	ros-controls
ROS_METAPKG=	yes

CATEGORIES=	motion
ROS_COMMENT=	generic control loop feedback mechanism
HOMEPAGE=	http://wiki.ros.org/ros_control

include ../../meta-pkgs/ros-base/Makefile.common

# drop "gmock" dependency, not widely available
CMAKE_ARGS+=	-DCATKIN_ENABLE_TESTING=FALSE

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../devel/ros-realtime-tools/depend.mk
include ../../devel/tinyxml/depend.mk
include ../../graphics/ros-rqt/depend.mk
include ../../graphics/ros-urdf/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../net/ros-resource-retriever/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/robotpkg.mk
