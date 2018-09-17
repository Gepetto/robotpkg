# robotpkg Makefile for:	sysutils/ros-rqt-plot
# Created:			Anthony Mallet on Mon, 17 Sep 2018
#

ROS_PKG=		rqt_plot
ROS_VERSION=		0.4.8
ROS_REPO=		ros-visualization

CATEGORIES=		sysutils
ROS_COMMENT=		GUI plugin visualizing numeric values in a 2D plot

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/rqt_plot
SUBST_FILES.py-interp+=	src/*/*.py

include ../../devel/ros-catkin/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../graphics/ros-qt-gui-core/depend.mk
include ../../graphics/ros-rqt/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/py-matplotlib.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/robotpkg.mk
