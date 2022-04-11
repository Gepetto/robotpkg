# robotpkg depend.mk for:	sysutils/py-ros2-rpyutils
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_ROS2_RPYUTILS_DEPEND_MK:=	${PY_ROS2_RPYUTILS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-ros2-rpyutils
endif

ifeq (+,$(PY_ROS2_RPYUTILS_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		py-ros2-rpyutils

DEPEND_ABI.py-ros2-rpyutils?=	${PKGTAG.python}-ros2-rpyutils>=0
DEPEND_DIR.py-ros2-rpyutils?=	../../sysutils/py-ros2-rpyutils

SYSTEM_SEARCH.py-ros2-rpyutils=\
  '${PYTHON_SYSLIBSEARCH}/rpyutils/__init__.py'			\
  'share/rpyutils/package.xml:/<version>/s/[^0-9.]//gp'

DEPEND_ABI.python+= python>=3

include ../../mk/sysdep/python.mk

endif # PY_ROS2_RPYUTILS_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
