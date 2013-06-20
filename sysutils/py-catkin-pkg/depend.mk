# robotpkg depend.mk for:	sysutils/py-catkin-pkg
# Created:			Anthony Mallet on Thu, 20 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_CATKIN_PKG_DEPEND_MK:=	${PY_CATKIN_PKG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-catkin-pkg
endif

ifeq (+,$(PY_CATKIN_PKG_DEPEND_MK)) # ------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.py-catkin-pkg?=		${PREFER.ros-base}
SYSTEM_PREFIX.py-catkin-pkg?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			py-catkin-pkg

DEPEND_ABI.py-catkin-pkg?=	${PKGTAG.python}-catkin-pkg>=0.1.15
DEPEND_DIR.py-catkin-pkg?=	../../sysutils/py-catkin-pkg

SYSTEM_SEARCH.py-catkin-pkg=\
  'bin/catkin_create_pkg'				\
  '${PYTHON_SYSLIBSEARCH}/catkin_pkg/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.py-catkin-pkg=python-catkin-pkg

include ../../mk/sysdep/python.mk

endif # PY_CATKIN_PKG_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
