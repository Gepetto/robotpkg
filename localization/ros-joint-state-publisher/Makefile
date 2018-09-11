# robotpkg Makefile for:	localization/ros-joint-state-publisher
# Created:			Anthony Mallet on Tue, 11 Sep 2018
#

ROS_PKG=		joint_state_publisher
ROS_VERSION=		1.12.13

CATEGORIES=		localization
ROS_COMMENT=		node publishing joint state values for a given URDF

include ../../meta-pkgs/ros-base/Makefile.common

WRKSRC=			${WRKDIR}/${DISTNAME}/${ROS_PKG}

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	joint_state_publisher/joint_state_publisher

include ../../devel/ros-catkin/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../mk/robotpkg.mk
