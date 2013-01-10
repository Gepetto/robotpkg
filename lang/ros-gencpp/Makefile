# robotpkg Makefile for:	lang/ros-gencpp
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		gencpp
ROS_VERSION=		0.3.4

CATEGORIES=		lang
ROS_COMMENT=		C++ code generator for ROS .msg format
HOMEPAGE=		http://www.ros.org/wiki/roscpp

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-distsetup

include ../../devel/catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
