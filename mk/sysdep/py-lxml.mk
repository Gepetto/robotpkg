# robotpkg sysdep/py-lxml.mk
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_LXML_DEPEND_MK:=	${PY_LXML_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-lxml
endif

ifeq (+,$(PY_LXML_DEPEND_MK)) # --------------------------------------------

PREFER.py-lxml?=	system

DEPEND_USE+=		py-lxml
DEPEND_ABI.py-lxml?=	${PKGTAG.python-}lxml>=0

SYSTEM_SEARCH.py-lxml=\
  '${PYTHON_SYSLIBSEARCH}/lxml/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.py-lxml= python${PYTHON_MAJOR}-lxml
SYSTEM_PKG.NetBSD.py-lxml= security/${PKGTAG.python-}lxml
SYSTEM_PKG.RedHat.py-lxml= python${PYTHON_MAJOR}-lxml

include ../../mk/sysdep/python.mk

endif # PY_LXML_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
