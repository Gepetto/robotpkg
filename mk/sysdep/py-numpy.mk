# robotpkg sysdep/py-numpy.mk
# Created:			Anthony Mallet on Set, 22 Jun 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_NUMPY_DEPEND_MK:=	${PY_NUMPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-numpy
endif

ifeq (+,$(PY_NUMPY_DEPEND_MK)) # -------------------------------------------

PREFER.py-numpy?=	system

DEPEND_USE+=		py-numpy
DEPEND_ABI.py-numpy?=	${PKGTAG.python-}numpy>=1

SYSTEM_SEARCH.py-numpy=\
  '${PYTHON_SYSLIBSEARCH}/numpy/__init__.py'				\
  '${PYTHON_SYSLIBSEARCH}/numpy/version.py:/full_version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.py-numpy=	python-numpy (python-${PYTHON_VERSION})
SYSTEM_PKG.Ubuntu.py-numpy=	python-numpy (python-${PYTHON_VERSION})
SYSTEM_PKG.Debian.py-numpy=	python-numpy (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-numpy=	math/${PKGTAG.python-}numpy

include ../../mk/sysdep/python.mk

endif # PY_NUMPY_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
