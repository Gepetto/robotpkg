# robotpkg Makefile for:	middleware/ros-actionlib
# Created:			Anthony Mallet on Tue, 9 Oct 2012
#

ROS_PKG=	actionlib
ROS_VERSION=	1.9.12
ROS_GITTAG=	708826c9b9f92fcc9fb06a36dfe5755f9c3586a8

CATEGORIES=	middleware
ROS_COMMENT=	standardized interface for preemptable tasks

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	src/actionlib/*.py
SUBST_FILES.py-interp+=	test/*.py
SUBST_FILES.py-interp+=	tools/*.py

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
