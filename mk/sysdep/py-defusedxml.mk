# robotpkg sysdep/py-defusedxml.mk
# Created:			Anthony Mallet on Mon, 17 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYDEFUSEDXML_DEPEND_MK:=	${PYDEFUSEDXML_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-defusedxml
endif

ifeq (+,$(PYDEFUSEDXML_DEPEND_MK)) # ---------------------------------------

PREFER.py-defusedxml?=	system

DEPEND_USE+=		py-defusedxml
DEPEND_ABI.py-defusedxml?=	${PKGTAG.python-}defusedxml>=0

SYSTEM_SEARCH.py-defusedxml=\
  '${PYTHON_SYSLIBSEARCH}/defusedxml/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.RedHat.py-defusedxml= python${PYTHON_MAJOR}-defusedxml
SYSTEM_PKG.Debian.py-defusedxml= python$(subst 2,,${PYTHON_MAJOR})-defusedxml
SYSTEM_PKG.NetBSD.py-defusedxml= pkgsrc/textproc/${PKGTAG.python-}defusedxml

include ../../mk/sysdep/python.mk

endif # PYDEFUSEDXML_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
