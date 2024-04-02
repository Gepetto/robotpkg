# robotpkg depend.mk for:	math/py-proxsuite
# Created:			Guilhem Saurel on Mon, 29 Aug 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_PROXSUITE_DEPEND_MK:=	${PY_PROXSUITE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-proxsuite
endif

ifeq (+,$(PY_PROXSUITE_DEPEND_MK)) # ------------------------------------------

PREFER.py-proxsuite?=		robotpkg

SYSTEM_SEARCH.py-proxsuite=\
  '${PYTHON_SYSLIBSEARCH}/proxsuite/__init__.py'

DEPEND_USE+=			py-proxsuite

DEPEND_ABI.py-proxsuite?=	${PKGTAG.python-}proxsuite>=0.1.0
DEPEND_DIR.py-proxsuite?=	../../optimization/py-proxsuite

endif # PY_PROXSUITE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
