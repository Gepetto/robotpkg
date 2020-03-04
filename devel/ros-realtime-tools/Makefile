# robotpkg Makefile for:	devel/ros-realtime-tools
# Created:			Aurelie Clodic on Thu, 28 Nov 2013
#

ROS_PKG=	realtime_tools
ROS_VERSION=	1.15.1
ROS_REPO=	ros-controls

CATEGORIES=	devel
ROS_COMMENT=	topic publisher from reatime threads

include ../../meta-pkgs/ros-base/Makefile.common

# drop "gmock" dependency, not widely available
CMAKE_ARGS+=	-DCATKIN_ENABLE_TESTING=FALSE

DEPEND_ABI.ros+=ros>=hydro

include ../../devel/ros-catkin/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
