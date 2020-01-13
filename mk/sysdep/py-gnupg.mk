# robotpkg sysdep/py-gnupg.mk
# Created:			Anthony Mallet on Mon, 17 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYGNUPG_DEPEND_MK:=	${PYGNUPG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-gnupg
endif

ifeq (+,$(PYGNUPG_DEPEND_MK)) # --------------------------------------------

PREFER.py-gnupg?=	system

DEPEND_USE+=		py-gnupg
DEPEND_ABI.py-gnupg?=	${PKGTAG.python-}gnupg>=0

# Also look for python-gnupginterface util pkgsrc gets a real python-gnupg
SYSTEM_SEARCH.py-gnupg=\
  '${PYTHON_SYSLIBSEARCH}/{gnupg,GnuPGInterface}.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Arch.py-gnupg= python$(subst 3,,${PYTHON_MAJOR})-gnupg
SYSTEM_PKG.RedHat.py-gnupg= python${PYTHON_MAJOR}-gnupg
SYSTEM_PKG.Debian.py-gnupg= python$(subst 2,,${PYTHON_MAJOR})-gnupg
SYSTEM_PKG.NetBSD.py-gnupg= pkgsrc/security/${PKGTAG.python-}gnupg

include ../../mk/sysdep/python.mk

endif # PYGNUPG_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
