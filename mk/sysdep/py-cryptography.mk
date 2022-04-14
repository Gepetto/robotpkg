# robotpkg sysdep/py-cryptography.mk
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_CRYPTOGRAPHY_DEPEND_MK:=	${PY_CRYPTOGRAPHY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-cryptography
endif

ifeq (+,$(PY_CRYPTOGRAPHY_DEPEND_MK)) # ------------------------------------

PREFER.py-cryptography?=	system

DEPEND_USE+=			py-cryptography
DEPEND_ABI.py-cryptography?=	${PKGTAG.python-}cryptography>=0

SYSTEM_SEARCH.py-cryptography=\
  '${PYTHON_SYSLIBSEARCH}/cryptography/__init__.py'			\
  '${PYTHON_SYSLIBSEARCH}/cryptography/__about__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.py-cryptography= python${PYTHON_MAJOR}-cryptography
SYSTEM_PKG.NetBSD.py-cryptography= security/${PKGTAG.python-}cryptography
SYSTEM_PKG.RedHat.py-cryptography= python${PYTHON_MAJOR}-cryptography

include ../../mk/sysdep/python.mk

endif # PY_CRYPTOGRAPHY_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
