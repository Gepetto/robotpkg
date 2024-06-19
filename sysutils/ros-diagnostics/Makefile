# robotpkg Makefile for:	sysutils/ros-diagnostics
# Created:			Séverin Lemaignan on Tue, 6 Aug 2013
#

ROS_PKG=	diagnostics
ROS_VERSION=	1.11.0
ROS_METAPKG=	yes

CATEGORIES=	sysutils
ROS_COMMENT=	gathering, viewing, and analyzing diagnostics data from robots

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=\
  diagnostic_common_diagnostics/src/diagnostic_common_diagnostics/*.py

include ../../devel/ros-bond-core/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../math/ros-geometry/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
