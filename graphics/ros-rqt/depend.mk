# robotpkg depend.mk for:	devel/ros-rqt
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_RQT_DEPEND_MK:=	${ROS_RQT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-rqt
endif

ifeq (+,$(ROS_RQT_DEPEND_MK)) # --------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-rqt?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-rqt?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-rqt
ROS_DEPEND_USE+=	ros-rqt

DEPEND_DIR.ros-rqt?=	../../graphics/ros-rqt

DEPEND_ABI.ros-rqt.groovy?=	ros-rqt>=0.2<0.3
DEPEND_ABI.ros-rqt.hydro?=	ros-rqt>=0.2<0.3
DEPEND_ABI.ros-rqt.indigo?=	ros-rqt>=0.2<0.5
DEPEND_ABI.ros-rqt.jade?=	ros-rqt>=0.2<0.5
DEPEND_ABI.ros-rqt.kinetic?=	ros-rqt>=0.3<0.6
DEPEND_ABI.ros-rqt.lunar?=	ros-rqt>=0.3<0.6
DEPEND_ABI.ros-rqt.melodic?=	ros-rqt>=0.3<0.6
DEPEND_ABI.ros-rqt.noetic?=	ros-rqt>=0.5<0.6

SYSTEM_SEARCH.ros-rqt=\
  'bin/rqt'							\
  'include/rqt_gui_cpp/plugin.h'				\
  'lib/librqt_gui_cpp.so'					\
  'share/rqt_gui/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/rqt_gui_cpp/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/rqt_gui_py/package.xml:/<version>/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/rqt_gui/__init__.py'			\
  '${PYTHON_SYSLIBSEARCH}/rqt_gui_py/__init__.py'		\
  'lib/pkgconfig/rqt_gui.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/rqt_gui_cpp.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/rqt_gui_py.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_RQT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
