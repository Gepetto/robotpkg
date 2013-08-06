# robotpkg Makefile for:	meta-pkgs/ros-desktop
# Created:			Anthony Mallet on Sun, 23 Jun 2013
#

PKGREVISION=	4
DISTNAME=	ros-desktop-1.9
CATEGORIES=	meta-pkgs
META_PACKAGE=	yes

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.ros.org/wiki/
COMMENT=	The Robotic Operating System - Desktop set

NOT_FOR_PLATFORM=
MESSAGE_SRC=	../../meta-pkgs/ros-base/MESSAGE
MESSAGE_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}

PREFER.ros?=	robotpkg
DEPEND_ABI.ros=	ros==groovy

# TODO:
# common-tutorials
# documentation
# executive-smach
# filters
# geometry-experimental
# geometry-tutorials
# laser-pipeline
# navigation-tutorials
# robot-model-tutorials
# robot-model-visualization
# ros-tutorials
# rviz
# visualization-tutorials
# xacro

include ../../devel/ros-bond-core/depend.mk
include ../../devel/ros-nodelet-core/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../graphics/ros-qt-gui-core/depend.mk
include ../../graphics/ros-robot-model/depend.mk
include ../../graphics/ros-rqt-common-plugins/depend.mk
include ../../image/ros-image-common/depend.mk
include ../../image/ros-vision-opencv/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../math/ros-geometry/depend.mk
include ../../sysutils/ros-diagnostics/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../localization/ros-robot-state-publisher/depend.mk
include ../../hardware/ros-driver-common/depend.mk
include ../../mk/robotpkg.mk
