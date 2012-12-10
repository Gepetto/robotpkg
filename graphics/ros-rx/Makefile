# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#

ROS_PKG=		rx
ROS_VERSION=		1.8.9

CATEGORIES=		graphics
ROS_COMMENT=		GUI tools
HOMEPAGE=		http://www.ros.org/wiki/rx

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-distsetup

include ../../devel/catkin/depend.mk
include ../../devel/ros-core/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../sysutils/rospack/depend.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/py-matplotlib.mk
include ../../mk/sysdep/py-wxpython.mk
include ../../mk/sysdep/wxwidgets.mk
include ../../mk/robotpkg.mk
