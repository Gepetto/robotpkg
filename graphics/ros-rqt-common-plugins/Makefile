# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#

ROS_PKG=		rqt_common_plugins
ROS_METAPKG=		yes
ROS_VERSION=		0.2.16
ROS_REPO=		ros-visualization

CATEGORIES=		graphics
ROS_COMMENT=		backend graphical tools suite

include ../../meta-pkgs/ros-base/Makefile.common

USE_QMAKE=		no
DEPEND_ABI.qmake+=	qmake>=2
CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	*/scripts/*
SUBST_FILES.py-interp+=	*/src/*/*.py
SUBST_FILES.py-interp+=	*/test/*.py

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../graphics/ros-qt-gui-core/depend.mk
include ../../graphics/ros-rqt/depend.mk
include ../../image/ros-image-common/depend.mk
include ../../image/ros-vision-opencv/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-genpy/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/py-matplotlib.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/qt4-libs.mk
include ../../mk/robotpkg.mk
