# robotpkg Makefile for:	lang/ros-genpy
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		genpy
ROS_VERSION=		0.3.7

CATEGORIES=		lang
ROS_COMMENT=		python code generator for ROS .msg format
HOMEPAGE=		http://www.ros.org/wiki/genpy

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-distsetup

include ../../devel/catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
