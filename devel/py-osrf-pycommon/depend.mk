# robotpkg depend.mk for:	devel/py-osrf-pycommon
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_OSRF_COMMON_DEPEND_MK:=	${PY_OSRF_COMMON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-osrf-pycommon
endif

ifeq (+,$(PY_OSRF_COMMON_DEPEND_MK)) # -------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		py-osrf-pycommon

DEPEND_ABI.py-osrf-pycommon?=	${PKGTAG.python-}osrf-pycommon>=0
DEPEND_DIR.py-osrf-pycommon?=	../../devel/py-osrf-pycommon

SYSTEM_SEARCH.py-osrf-pycommon=\
  '${PYTHON_SYSLIBSEARCH}/osrf_pycommon/__init__.py'		\
  'share/osrf_pycommon/package.xml:/<version>/s/[^0-9.]//gp'

DEPEND_ABI.python+= python>=3

include ../../mk/sysdep/python.mk

endif # PY_OSRF_COMMON_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
