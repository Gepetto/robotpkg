# robotpkg depend.mk for:	sysutils/py-rosdistro
# Created:			Anthony Mallet on Thu, 20 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_ROSDISTRO_DEPEND_MK:=	${PY_ROSDISTRO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-rosdistro
endif

ifeq (+,$(PY_ROSDISTRO_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.py-rosdistro?=		${PREFER.ros-base}
SYSTEM_PREFIX.py-rosdistro?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			py-rosdistro

DEPEND_ABI.py-rosdistro?=	${PKGTAG.python}-rosdistro>=0.2.9
DEPEND_DIR.py-rosdistro?=	../../sysutils/py-rosdistro

SYSTEM_SEARCH.py-rosdistro=\
  'bin/rosdistro_build_cache'				\
  '${PYTHON_SYSLIBSEARCH}/rosdistro/__init__.py'
  '${PYTHON_SYSLIBSEARCH}/rosdistro/_version.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.py-rosdistro=python-rosdistro

include ../../mk/sysdep/python.mk

endif # PY_ROSDISTRO_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
