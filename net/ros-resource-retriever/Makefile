# robotpkg Makefile for:	net/ros-resource_retriever
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

# This is a sub-package of the robot_model, but which must be installed
# separately because of a circular dependency between robot_model and
# geometric_shapes.
#
ROS_PKG=	robot_model
ROS_VERSION=	1.11.5

PKGNAME=	ros-resource-retriever-${ROS_VERSION}
CATEGORIES=	net
ROS_COMMENT=	API to retrieve data from url-format files

include ../../meta-pkgs/ros-base/Makefile.common

WRKSRC=		${WRKDIR}/${ROS_PKG}-${ROS_VERSION}/resource_retriever

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/sysdep/libcurl.mk
include ../../mk/robotpkg.mk
