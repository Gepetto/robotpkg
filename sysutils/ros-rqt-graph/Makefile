# robotpkg Makefile for:	sysutils/ros-rqt-graph
# Created:			Anthony Mallet on Mon, 17 Sep 2018
#

ROS_PKG=		rqt_graph
ROS_VERSION=		0.4.10
ROS_REPO=		ros-visualization

CATEGORIES=		sysutils
ROS_COMMENT=		GUI plugin for visualizing the ROS computation graph

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/rqt_graph
SUBST_FILES.py-interp+=	src/*/*.py

include ../../devel/ros-catkin/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../graphics/ros-qt-gui-core/depend.mk
include ../../graphics/ros-rqt/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/robotpkg.mk
