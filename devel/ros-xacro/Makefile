# robotpkg Makefile for:	devel/ros-xacro
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

ROS_PKG=	xacro
ROS_VERSION=	1.14.18

CATEGORIES=	devel
ROS_COMMENT=	XML macro language

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/*.py

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-lint/depend.mk
include ../../mk/robotpkg.mk
