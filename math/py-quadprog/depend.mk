# robotpkg depend.mk for:	math/py27-quadprog
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_QUADPROG_DEPEND_MK:=	${PY_QUADPROG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-quadprog
endif

ifeq (+,$(PY_QUADPROG_DEPEND_MK)) # ----------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-quadprog?=	robotpkg

DEPEND_USE+=		py-quadprog

DEPEND_ABI.py-quadprog?=${PKGTAG.python-}quadprog>=0.1.6
DEPEND_DIR.py-quadprog?=../../math/py-quadprog

SYSTEM_SEARCH.py-quadprog=\
  '${PYTHON_SITELIB}/quadprog.{*.,}so'

endif # PY_QUADPROG_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
