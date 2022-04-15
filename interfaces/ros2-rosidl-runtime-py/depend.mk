# robotpkg depend.mk for:	interfaces/ros2-rosidl-runtime-py
# Created:			Anthony Mallet on Fri, 15 Apr 2022
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS2_ROSIDL_RUNTIME_PY_DEPEND_MK:=	${ROS2_ROSIDL_RUNTIME_PY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros2-rosidl-runtime-py
endif

ifeq (+,$(ROS2_ROSIDL_RUNTIME_PY_DEPEND_MK)) # -----------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=			ros2-rosidl-runtime-py

DEPEND_DIR.ros2-rosidl-runtime-py?=	../../interfaces/ros2-rosidl-runtime-py
DEPEND_ABI.ros2-rosidl-runtime-py?=	ros2-rosidl-runtime-py>=0

SYSTEM_SEARCH.ros2-rosidl-runtime-py=\
  '${PYTHON_SYSLIBSEARCH}/rosidl_runtime_py/__init__.py'	\
  'share/rosidl_runtime_py/package.xml:/<version>/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS2_ROSIDL_RUNTIME_PY_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
