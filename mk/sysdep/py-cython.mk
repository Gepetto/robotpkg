# robotpkg sysdep/py-cython.mk
# Created:			Guilhem Saurel, on Wed, 15 Jan 2019
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_CYTHON_DEPEND_MK:=	${PY_CYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-cython
endif

ifeq (+,$(PY_CYTHON_DEPEND_MK)) # -------------------------------------------

PREFER.py-cython?=	system

DEPEND_USE+=		py-cython
DEPEND_ABI.py-cython?=	${PKGTAG.python-}cython>=0.20.0

SYSTEM_SEARCH.py-cython=\
  '${PYTHON_SYSLIBSEARCH}/cython.py'				\
  '${PYTHON_SYSLIBSEARCH}/Cython/Shadow.py:/^__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Arch.py-cython=	cython (cython${PYTHON_MAJOR})
SYSTEM_PKG.Fedora.py-cython=	python${PYTHON_MAJOR}-Cython
SYSTEM_PKG.Debian.py-cython=	cython (cython${PYTHON_MAJOR})
SYSTEM_PKG.NetBSD.py-cython=	devel/${PKGTAG.python-}cython

include ../../mk/sysdep/python.mk

endif # PY_CYTHON_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
