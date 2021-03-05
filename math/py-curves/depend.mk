# robotpkg depend.mk for:	math/py27-curves
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_CURVES_DEPEND_MK:=	${PY_CURVES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-curves
endif

ifeq (+,$(PY_CURVES_DEPEND_MK)) # ------------------------------------------

PREFER.py-curves?=	robotpkg

DEPEND_USE+=		py-curves

DEPEND_ABI.py-curves?=	${PKGTAG.python-}curves>=0.3.1
DEPEND_DIR.py-curves?=	../../math/py-curves

SYSTEM_SEARCH.py-curves=\
  '${PYTHON_SYSLIBSEARCH}/{nd_,}curves/{nd_,}curves.so'

include ../../mk/sysdep/python.mk

endif # PY_CURVES_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
