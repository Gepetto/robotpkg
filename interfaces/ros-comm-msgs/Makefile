# robotpkg Makefile for:	interfaces/ros-comm-msgs
# Created:			Anthony Mallet on Wed, 13 Aug 2014
#

PKGREVISION=	1
ROS_PKG=	ros_comm_msgs
ROS_VERSION=	1.11.2
ROS_METAPKG=	yes

PKGNAME=	$(subst _,-,${ROS_PKG})-${ROS_VERSION}

CATEGORIES=	interfaces
ROS_COMMENT=	standard messages definition

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/ros-catkin/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../mk/robotpkg.mk
