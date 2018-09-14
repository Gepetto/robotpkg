# robotpkg Makefile for:	interfaces/ros-navigation-msgs
# Created:			Anthony Mallet on Fri, 14 Sep 2018
#

ROS_PKG=	navigation_msgs
ROS_VERSION=	1.13.0
ROS_REPO=	ros-planning
ROS_METAPKG=	yes

CATEGORIES=	interfaces
ROS_COMMENT=	messages commonly used in navigation packages
CONFLICTS+=	ros-map-msgs-[0-9]*

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/ros-catkin/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../mk/robotpkg.mk
