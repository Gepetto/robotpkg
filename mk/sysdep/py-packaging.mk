# robotpkg sysdep/py-packaging.mk
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_PACKAGING_DEPEND_MK:=	${PY_PACKAGING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-packaging
endif

ifeq (+,$(PY_PACKAGING_DEPEND_MK)) # ---------------------------------------

PREFER.py-packaging?=		system

DEPEND_USE+=			py-packaging
DEPEND_ABI.py-packaging?=	${PKGTAG.python-}packaging

SYSTEM_SEARCH.py-packaging=\
  '${PYTHON_SYSLIBSEARCH}/packaging/__init__.py'

SYSTEM_PKG.py-packaging=	python${PYTHON_MAJOR}-packaging
SYSTEM_PKG.NetBSD.py-packaging=devel/${PKGTAG.python-}packaging

include ../../mk/sysdep/python.mk

endif # PY_PACKAGING_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
