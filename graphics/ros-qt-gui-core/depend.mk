# robotpkg depend.mk for:	devel/ros-qt-gui-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_QT_GUI_CORE_DEPEND_MK:=	${ROS_QT_GUI_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-qt-gui-core
endif

ifeq (+,$(ROS_QT_GUI_CORE_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-qt-gui-core?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-qt-gui-core?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-qt-gui-core
ROS_DEPEND_USE+=		ros-qt-gui-core

DEPEND_DIR.ros-qt-gui-core?=	../../graphics/ros-qt-gui-core

DEPEND_ABI.ros-qt-gui-core.groovy?=	ros-qt-gui-core>=0.2<0.3
DEPEND_ABI.ros-qt-gui-core.hydro?=	ros-qt-gui-core>=0.2<0.3
DEPEND_ABI.ros-qt-gui-core.indigo?=	ros-qt-gui-core>=0.2<0.3
DEPEND_ABI.ros-qt-gui-core.jade?=	ros-qt-gui-core>=0.2<0.3
DEPEND_ABI.ros-qt-gui-core.kinetic?=	ros-qt-gui-core>=0.3<0.4
DEPEND_ABI.ros-qt-gui-core.lunar?=	ros-qt-gui-core>=0.3<0.4
DEPEND_ABI.ros-qt-gui-core.melodic?=	ros-qt-gui-core>=0.3<0.4
DEPEND_ABI.ros-qt-gui-core.noetic?=	ros-qt-gui-core>=0.4<0.5

SYSTEM_SEARCH.ros-qt-gui-core=\
  'include/qt_gui_cpp/settings.h'				\
  'lib/libqt_gui_cpp.so'					\
  'share/qt_dotgraph/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/qt_gui/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/qt_gui_cpp/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/qt_gui_py_common/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/qt_gui_app/package.xml:/<version>/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/qt_dotgraph/__init__.py'		\
  '${PYTHON_SYSLIBSEARCH}/qt_gui/__init__.py'			\
  '${PYTHON_SYSLIBSEARCH}/qt_gui_cpp/__init__.py'		\
  '${PYTHON_SYSLIBSEARCH}/qt_gui_py_common/__init__.py'		\
  'lib/pkgconfig/qt_dotgraph.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/qt_gui.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/qt_gui_cpp.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/qt_gui_py_common.pc:/Version/s/[^0-9.]//gp'	\
  'lib/pkgconfig/qt_gui_app.pc:/Version/s/[^0-9.]//gp'

include ../../devel/ros-pluginlib/depend.mk
include ../../mk/sysdep/python.mk

endif # ROS_QT_GUI_CORE_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
