# robotpkg Makefile for:	devel/ros-xacro
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

ROS_PKG=	xacro
ROS_VERSION=	1.7.3
ROS_GITTAG=	3786a6a69ba61cd8bdc231ef57ea6916ced2c7a7

CATEGORIES=	devel
ROS_COMMENT=	XML macro language

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/*.py

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/ros-catkin/depend.mk
include ../../mk/robotpkg.mk
