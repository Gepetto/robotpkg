# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#

ROS_PKG=		rqt
ROS_METAPKG=		yes
ROS_VERSION=		0.2.14
ROS_REPO=		ros-visualization

CATEGORIES=		graphics
ROS_COMMENT=		Qt-based framework for GUI development

include ../../meta-pkgs/ros-base/Makefile.common

USE_QMAKE=		no
DEPEND_ABI.qmake+=	qmake>=2
CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	rqt_gui/bin/rqt* rqt_gui/src/rqt_gui/main.py

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-nodelet-core/depend.mk
include ../../graphics/ros-qt-gui-core/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/qt4-libs.mk
include ../../mk/robotpkg.mk
