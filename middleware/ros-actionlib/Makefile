# robotpkg Makefile for:	middleware/ros-actionlib
# Created:			Anthony Mallet on Tue, 9 Oct 2012
#

ROS_PKG=		actionlib
ROS_VERSION=		1.8.7

CATEGORIES=		middleware
ROS_COMMENT=		standardized interface for preemptable tasks
HOMEPAGE=		http://www.ros.org/wiki/actionlib

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-distsetup

include ../../devel/catkin/depend.mk
include ../../devel/ros-core/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-langs/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
