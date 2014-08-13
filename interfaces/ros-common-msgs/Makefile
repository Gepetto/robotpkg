# robotpkg Makefile for:	interfaces/ros-common-msgs
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=	common_msgs
ROS_METAPKG=	yes
ROS_VERSION=	1.11.4

CATEGORIES=	interfaces
ROS_COMMENT=	common messages definition

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	actionlib_msgs/scripts/genaction.py
SUBST_FILES.py-interp+=	sensor_msgs/src/sensor_msgs/point_cloud2.py

include ../../devel/ros-catkin/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../mk/robotpkg.mk
