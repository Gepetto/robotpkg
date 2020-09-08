# robotpkg depend.mk for:	robots/py27-example-robot-data
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_EXAMPLE_ROBOT_DATA_DEPEND_MK:=	${PY_EXAMPLE_ROBOT_DATA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-example-robot-data
endif

ifeq (+,$(PY_EXAMPLE_ROBOT_DATA_DEPEND_MK)) # ------------------------------

PREFER.py-example-robot-data?=		robotpkg

DEPEND_USE+=				py-example-robot-data

DEPEND_ABI.py-example-robot-data?=	${PKGTAG.python-}example-robot-data>=3.6.0
DEPEND_DIR.py-example-robot-data?=	../../robots/py-example-robot-data

SYSTEM_SEARCH.py-example-robot-data=\
  '${PYTHON_SYSLIBSEARCH}/example_robot_data/__init__.py'

include ../../mk/sysdep/python.mk

endif # PY_EXAMPLE_ROBOT_DATA_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
