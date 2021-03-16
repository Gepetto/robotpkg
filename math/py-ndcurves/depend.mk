# robotpkg depend.mk for:	math/py27-ndcurves
# Created:			Guilhem Saurel on Tue, 16 Mar 2021
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_NDCURVES_DEPEND_MK:=	${PY_NDCURVES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-ndcurves
endif

ifeq (+,$(PY_NDCURVES_DEPEND_MK)) # ------------------------------------------

PREFER.py-ndcurves?=	robotpkg

DEPEND_USE+=		py-ndcurves

DEPEND_ABI.py-ndcurves?=	${PKGTAG.python-}ndcurves>=1.0.0
DEPEND_DIR.py-ndcurves?=	../../math/py-ndcurves

SYSTEM_SEARCH.py-ndcurves=\
  '${PYTHON_SYSLIBSEARCH}/{nd,}curves/{nd,}curves.so'

include ../../mk/sysdep/python.mk

endif # PY_NDCURVES_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
