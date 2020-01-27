# robotpkg depend.mk for:	path/py38-hpp-fcl
# Created:			Guilhem Saurel on Tue, 19 Nov 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_HPP_FCL_DEPEND_MK:=	${PY_HPP_FCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-hpp-fcl
endif

ifeq (+,$(PY_HPP_FCL_DEPEND_MK)) # --------------------------------------------

PREFER.py-hpp-fcl?=	robotpkg

DEPEND_USE+=		py-hpp-fcl

DEPEND_ABI.py-hpp-fcl?=	${PKGTAG.python-}hpp-fcl>=1.2.0
DEPEND_DIR.py-hpp-fcl?=	../../path/py-hpp-fcl

SYSTEM_SEARCH.py-hpp-fcl=		\
  '${PYTHON_SYSLIBSEARCH}/hppfcl/__init__.py'

include ../../path/hpp-fcl/depend.mk
include ../../math/py-eigenpy/depend.mk

endif # PY_HPP_FCL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
