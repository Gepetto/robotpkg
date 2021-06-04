# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#

ROS_PKG=	qt_gui_core
ROS_VERSION=	0.4.2
ROS_REPO=	ros-visualization

CATEGORIES=	graphics
ROS_COMMENT=	infrastructure for Qt based GUI

include ../../meta-pkgs/ros-base/Makefile.common

# For some reason, catkin dislikes this meta-package. So build each package
# separately.
CONFIGURE_DIRS=\
  qt_dotgraph	\
  qt_gui	\
  qt_gui_app	\
  qt_gui_core	\
  qt_gui_cpp	\
  qt_gui_py_common

USE_QMAKE=		no
DEPEND_ABI.qmake+=	qmake>=2
CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}
CMAKE_ARGS+=\
  -DSETUPTOOLS_ARG_EXTRA="--single-version-externally-managed --root=/"

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	qt_dotgraph/test/*.py
SUBST_FILES.py-interp+= qt_gui/src/qt_gui/main.py
SUBST_FILES.py-interp+= qt_gui_app/scripts/qt_gui_app

DEPEND_ABI.ros-pluginlib.groovy+= ros-pluginlib>=1.9.23
DEPEND_ABI.ros-python-qt-binding.groovy+= ros-python-qt-binding>=0.2.11

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-nodelet-core/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/py-pydot.mk
include ../../mk/sysdep/py-sip.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/robotpkg.mk
