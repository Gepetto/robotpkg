# robotpkg Makefile for:	interfaces/ros-common-msgs
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		common-msgs
ROS_VERSION=		1.8.13

CATEGORIES=		interfaces
ROS_COMMENT=		common messages definition
HOMEPAGE=		http://www.ros.org/wiki/common_msgs

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp

SUBST_FILES.py-interp+=	actionlib_msgs/scripts/genaction.py

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/catkin/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-langs/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
