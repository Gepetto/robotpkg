# robotpkg mk/sysdep/py-scipy.mk
# Created:			Guilhem Saurel, on Thu, 04 Jul 2019
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_SCIPY_DEPEND_MK:=	${PY_SCIPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-scipy
endif

ifeq (+,$(PY_SCIPY_DEPEND_MK)) # -------------------------------------------

PREFER.py-scipy?=	system

DEPEND_USE+=		py-scipy
DEPEND_ABI.py-scipy?=	${PKGTAG.python-}scipy>=0.17.0

SYSTEM_SEARCH.py-scipy=\
  '${PYTHON_SYSLIBSEARCH}/scipy/__init__.py'				\
  '${PYTHON_SYSLIBSEARCH}/scipy/version.py:/^version = /s/[^0-9.]//gp'

SYSTEM_PKG.Arch.py-scipy=	python$(filter ${PYTHON_MAJOR},2)-scipy
SYSTEM_PKG.Debian.py-scipy=	python$(filter ${PYTHON_MAJOR},3)-scipy
SYSTEM_PKG.Fedora.py-scipy=	python${PYTHON_MAJOR}-scipy

include ../../mk/sysdep/python.mk

endif # PY_SCIPY_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
