# robotpkg depend.mk for:	optimization/py27-tsid
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_TSID_DEPEND_MK:=	${PY_TSID_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-tsid
endif

ifeq (+,$(PY_TSID_DEPEND_MK)) # --------------------------------------------

PREFER.py-tsid?=	robotpkg

DEPEND_USE+=		py-tsid

DEPEND_ABI.py-tsid?=	${PKGTAG.python-}tsid>=1.0.0
DEPEND_DIR.py-tsid?=	../../optimization/py-tsid

SYSTEM_SEARCH.py-tsid=\
  '${PYTHON_SYSLIBSEARCH}/tsid/__init__.py'

endif # PY_TSID_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
