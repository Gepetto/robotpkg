# robotpkg sysdep/py-crypto.mk
# Created:			Anthony Mallet on Mon, 17 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYCRYPTO_DEPEND_MK:=	${PYCRYPTO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-crypto
endif

ifeq (+,$(PYCRYPTO_DEPEND_MK)) # -------------------------------------------

PREFER.py-crypto?=	system

DEPEND_USE+=		py-crypto
DEPEND_ABI.py-crypto?=	${PKGTAG.python-}crypto>=0

SYSTEM_SEARCH.py-crypto=\
  '${PYTHON_SYSLIBSEARCH}/Crypto/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.RedHat.py-crypto= python${PYTHON_MAJOR}-crypto
SYSTEM_PKG.Debian.py-crypto= python$(subst 2,,${PYTHON_MAJOR})-crypto
SYSTEM_PKG.NetBSD.py-crypto= pkgsrc/security/${PKGTAG.python-}crypto

include ../../mk/sysdep/python.mk

endif # PYCRYPTO_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
