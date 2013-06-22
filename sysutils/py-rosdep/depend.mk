# robotpkg depend.mk for:	sysutils/py27-rosdep
# Created:			Anthony Mallet on Sat, 22 Jun 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_ROSDEP_DEPEND_MK:=	${PY_ROSDEP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-rosdep
endif

ifeq (+,$(PY_ROSDEP_DEPEND_MK)) # ------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.py-rosdep?=		${PREFER.ros-base}
SYSTEM_PREFIX.py-rosdep?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			py-rosdep

DEPEND_ABI.py-rosdep?=		${PKGTAG.python}-rosdep>=0.10.0
DEPEND_DIR.py-rosdep?=		../../sysutils/py-rosdep

SYSTEM_SEARCH.py-rosdep=\
  'bin/rosdep'								\
  '${PYTHON_SYSLIBSEARCH}/rosdep2/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.py-rosdep=	python-rosdep

include ../../mk/sysdep/python.mk

endif # PY_ROSDEP_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
