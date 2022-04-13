# robotpkg sysdep/py-pybind11.mk
# Created:			Anthony Mallet on Thu Apr 14 2022
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_PYBIND11_DEPEND_MK:=	${PY_PYBIND11_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-pybind11
endif

ifeq (+,$(PY_PYBIND11_DEPEND_MK)) # ----------------------------------------

PREFER.py-pybind11?=	system

DEPEND_USE+=		py-pybind11

DEPEND_METHOD.py-pybind11?=	build
DEPEND_ABI.py-pybind11?=	${PKGTAG.python}-pybind11>=0

# headers may be installed within python site-packages
_pybind11dirs={,${PYTHON_SYSLIBSEARCH}/pybind11/}

SYSTEM_SEARCH.py-pybind11=\
  '${_pybind11dirs}include/pybind11/pybind11.h'				\
  '${_pybind11dirs}{lib,share}/cmake/pybind11/pybind11Config.cmake'	\
  '${PYTHON_SYSLIBSEARCH}/pybind11/__init__.py'				\
  '${PYTHON_SYSLIBSEARCH}/pybind11/_version.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.py-pybind11=	python${PYTHON_MAJOR}-pybind11 pybind11-dev
SYSTEM_PKG.NetBSD.py-pybind11=	devel/${PKGTAG.python}-pybind11
SYSTEM_PKG.RedHat.py-pybind11=	python${PYTHON_MAJOR}-pybind11 pybind11-devel

include ../../mk/sysdep/python.mk

endif # PY_PYBIND11_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
