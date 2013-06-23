# robotpkg Makefile for:	meta-pkgs/ros-desktop
# Created:			Anthony Mallet on Sun, 23 Jun 2013
#

DISTNAME=	ros-desktop-1.9
CATEGORIES=	meta-pkgs
META_PACKAGE=	yes

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.ros.org/wiki/
COMMENT=	The Robotic Operating System - Desktop set

NOT_FOR_PLATFORM=
MESSAGE_SRC=	../../meta-pkgs/ros-base/MESSAGE
MESSAGE_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}

# TODO:
# bond-core
# common-tutorials
# diagnostics
# documentation
# driver-common
# dynamic-reconfigure
# executive-smach
# filters
# geometry
# geometry-experimental
# geometry-tutorials
# image-common
# laser-pipeline
# navigation-tutorials
# nodelet-core
# pluginlib
# python-qt-binding
# qt-gui-core
# robot-model
# robot-model-tutorials
# robot-model-visualization
# ros-tutorials
# rqt-common-plugins
# rviz
# vision-opencv
# visualization-tutorials
# xacro

include ../../devel/ros-ros/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
