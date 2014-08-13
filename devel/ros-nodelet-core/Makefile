# robotpkg Makefile for:	devel/roscpp-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=	nodelet_core
ROS_METAPKG=	yes
ROS_VERSION=	1.9.0

CATEGORIES=	devel
ROS_COMMENT=	zero copy transport inside a process

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	nodelet/script/*
SUBST_FILES.py-interp+=	nodelet_topic_tools/cfg/NodeletThrottle.cfg
SUBST_FILES.py-interp+=	test_nodelet/test/*.py
SUBST_FILES.py-interp+=	test_nodelet_topic_tools/test/*.py

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-bond-core/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../mk/sysdep/libuuid.mk
include ../../mk/robotpkg.mk
