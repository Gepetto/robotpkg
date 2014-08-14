# robotpkg depend.mk for:	devel/ros-python-qt-binding
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_PYTHON_QT_BINDING_DEPEND_MK:=	${ROS_PYTHON_QT_BINDING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-python-qt-binding
endif

ifeq (+,$(ROS_PYTHON_QT_BINDING_DEPEND_MK)) # ------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-python-qt-binding?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-python-qt-binding?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-python-qt-binding
ROS_DEPEND_USE+=			ros-python-qt-binding

DEPEND_ABI.ros-python-qt-binding?=	ros-python-qt-binding>=0.2
DEPEND_DIR.ros-python-qt-binding?=	../../graphics/ros-python-qt-binding

DEPEND_ABI.ros-python-qt-binding.groovy?=	ros-python-qt-binding>=0.2.10
DEPEND_ABI.ros-python-qt-binding.hydro?=	ros-python-qt-binding>=0.2.10
DEPEND_ABI.ros-python-qt-binding.indigo?=	ros-python-qt-binding>=0.2.10

SYSTEM_SEARCH.ros-python-qt-binding=\
  'share/python_qt_binding/package.xml:/<version>/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/python_qt_binding/__init__.py'		\
  'lib/pkgconfig/python_qt_binding.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_PYTHON_QT_BINDING_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
