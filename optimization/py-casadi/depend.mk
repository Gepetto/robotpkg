# robotpkg depend.mk for:	optimization/py-casadi
# Created:			Guilhem Saurel on Tue, 17 Oct 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_CASADI_DEPEND_MK:=	${PY_CASADI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-casadi
endif

ifeq (+,$(PY_CASADI_DEPEND_MK)) # ------------------------------------------

PREFER.casadi?=		robotpkg

SYSTEM_SEARCH.py-casadi=\
  'include/casadi/config.hpp:/CASADI_VERSION_STRING/s/[^0-9.]//gp'	\
  'lib/libcasadi.so'

DEPEND_USE+=		py-casadi

DEPEND_ABI.py-casadi?=	${PKGTAG.python-}casadi>=3.4.5
DEPEND_DIR.py-casadi?=	../../optimization/py-casadi

include ../../mk/sysdep/python.mk

endif # PY_CASADI_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
