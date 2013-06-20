# robotpkg Makefile for:	devel/ros-ros
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=	ros
ROS_METAPKG=	yes
ROS_VERSION=	1.9.47
ROS_GITTAG=	c198e3335b27655c1bdb48260ddcd4d4be6d15b1

CATEGORIES=	devel
ROS_COMMENT=	packaging system
HOMEPAGE=	http://www.ros.org/wiki/ROS

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp

SUBST_FILES.py-interp+=	core/mk/*.py
SUBST_FILES.py-interp+= core/rosbuild/*/*.py
SUBST_FILES.py-interp+= core/rosbuild/core/rosbuild/bin/*.py
SUBST_FILES.py-interp+=	core/roslib/*/*.py core/roslib/src/roslib/*.py
SUBST_FILES.py-interp+=	tools/*/src/*.py tools/*/src/*/*.py tools/*/test/*.py
SUBST_FILES.py-interp+=	tools/*/scripts/*
SUBST_FILES.py-interp+=	tools/*/scripts/*

SUBST_FILES.py-interp+=	core/rosbuild/bin/rosgcov_summarize
SUBST_FILES.py-interp+=	core/roslib/scripts/gendeps
SUBST_FILES.py-interp+=	core/roslib/env-hooks/10.ros.sh.em
SUBST_FILES.py-interp+=	tools/rosboost_cfg/scripts/rosboost-cfg
SUBST_FILES.py-interp+=	tools/rosboost_cfg/src/rosboost_cfg/rosboost_cfg.py

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../sysutils/ros-rospack/depend.mk
include ../../mk/robotpkg.mk
