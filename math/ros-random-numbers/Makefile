# robotpkg Makefile for:	math/ros-angles
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

ROS_PKG=	random_numbers
ROS_VERSION=	0.3.2
ROS_REPO=	ros-planning

CATEGORIES=	math
ROS_COMMENT=	wrappers for generating random floating point values

include ../../meta-pkgs/ros-base/Makefile.common

USE_BOOST_LIBS=	random math thread date_time

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../mk/robotpkg.mk
