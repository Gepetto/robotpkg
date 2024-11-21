# robotpkg depend.mk for:	path/py38-coal
# Created:			Guilhem Saurel on Tue, 19 Nov 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_COAL_DEPEND_MK:=	${PY_COAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-coal
endif

ifeq (+,$(PY_COAL_DEPEND_MK)) # --------------------------------------------

PREFER.py-coal?=	robotpkg

DEPEND_USE+=		py-coal

DEPEND_ABI.py-coal?=	${PKGTAG.python-}coal>=3.0.0
DEPEND_DIR.py-coal?=	../../path/py-coal

SYSTEM_SEARCH.py-coal=		\
  '${PYTHON_SYSLIBSEARCH}/coal/__init__.py'

include ../../path/coal/depend.mk
include ../../math/py-eigenpy/depend.mk

endif # PY_COAL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
