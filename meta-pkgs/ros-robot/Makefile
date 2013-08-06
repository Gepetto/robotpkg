# robotpkg Makefile for:	meta-pkgs/ros-robot
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DISTNAME=	ros-robot-1.9
CATEGORIES=	meta-pkgs
META_PACKAGE=	yes

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.ros.org/wiki/
COMMENT=	The Robotic Operating System - robot variant

NOT_FOR_PLATFORM=
MESSAGE_SRC=	../../meta-pkgs/ros-base/MESSAGE
MESSAGE_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}

PREFER.ros?=	robotpkg
DEPEND_ABI.ros=	ros==groovy

# TODO:
# driver-common
# executive-smach
# filters
# xacro
# convex_decomposition
# ivcon

# ros-base
include ../../middleware/ros-comm/depend.mk
include ../../devel/ros-ros/depend.mk

include ../../devel/ros-bond-core/depend.mk
include ../../devel/ros-nodelet-core/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../graphics/ros-robot-model/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../math/ros-geometry/depend.mk
include ../../sysutils/ros-diagnostics/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../localization/ros-robot-state-publisher/depend.mk
include ../../mk/robotpkg.mk
