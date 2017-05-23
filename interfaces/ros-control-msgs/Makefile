# robotpkg Makefile for:	interfaces/ros-control-msgs
# Created:			Anthony Mallet on Tue, 23 May 2017
#

PKGNAME=	ros-control-msgs-${ROS_VERSION}
ROS_PKG=	control_msgs
ROS_VERSION=	1.3.1
ROS_REPO=	ros-controls

CATEGORIES=	interfaces
ROS_COMMENT=	base messages and actions useful for controlling robots
HOMEPAGE=	http://wiki.ros.org/ros_control

WRKSRC?=	${WRKDIR}/${ROS_PKG}-${ROS_VERSION}/${ROS_PKG}

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../mk/robotpkg.mk
