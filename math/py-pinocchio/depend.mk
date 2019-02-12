# robotpkg depend.mk for:	math/py-pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_PINOCCHIO_DEPEND_MK:=	${PY_PINOCCHIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-pinocchio
endif

ifeq (+,$(PY_PINOCCHIO_DEPEND_MK)) # ---------------------------------------

PREFER.py-pinocchio?=		robotpkg

SYSTEM_SEARCH.py-pinocchio=\
  '${PYTHON_SYSLIBSEARCH}/pinocchio/__init__.py'

# no version information is present in any of the installed files: one cannot
# require a specific version
DEPEND_USE+=			py-pinocchio

DEPEND_ABI.py-pinocchio?=	${PKGTAG.python-}pinocchio>=2.0.0<3.0.0
DEPEND_DIR.py-pinocchio?=	../../math/py-pinocchio

include ../../mk/sysdep/python.mk

endif # PY_PINOCCHIO_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
