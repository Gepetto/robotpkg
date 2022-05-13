# robotpkg depend.mk for:	sysutils/py-rosdistro
# Created:			Anthony Mallet on Tue, 25 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_ROSDISTRO_DEPEND_MK:=	${PY_ROSDISTRO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-rosdistro
endif

ifeq (+,$(PY_ROSDISTRO_DEPEND_MK)) # ---------------------------------------

# select default preferences depending on OS/VERSION
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (NetBSD,${OPSYS})
  PREFER.py-rosdistro?=		robotpkg
endif
PREFER.py-rosdistro?=		system

DEPEND_USE+=			py-rosdistro

DEPEND_ABI.py-rosdistro?=	${PKGTAG.python}-rosdistro>=0.2.9
DEPEND_DIR.py-rosdistro?=	../../sysutils/py-rosdistro

SYSTEM_SEARCH.py-rosdistro=\
  '${PYTHON_SYSLIBSEARCH}/rosdistro/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.py-rosdistro=python${PYTHON_MAJOR}-rosdistro

include ../../mk/sysdep/python.mk

endif # PY_ROSDISTRO_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
