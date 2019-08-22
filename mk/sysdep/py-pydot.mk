# robotpkg sysdep/py-pydot.mk
# Created:			Anthony Mallet on Sat, 29 Jun 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_PYDOT_DEPEND_MK:=	${PY_PYDOT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-pydot
endif

ifeq (+,$(PY_PYDOT_DEPEND_MK)) # -------------------------------------------

PREFER.py-pydot?=	system

DEPEND_USE+=		py-pydot
DEPEND_ABI.py-pydot?=	${PKGTAG.python-}pydot>=1

SYSTEM_SEARCH.py-pydot=\
  '${PYTHON_SYSLIBSEARCH}/{,python-pydot/}pydot.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Arch.py-pydot=	python$(subst 3,,${PYTHON_MAJOR})-pydot
SYSTEM_PKG.Ubuntu.py-pydot=	python$(subst 2,,${PYTHON_MAJOR})-pydot
SYSTEM_PKG.RedHat.py-pydot=	python-pydot (python-${PYTHON_VERSION})
SYSTEM_PKG.Debian.py-pydot=	python-pydot (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-pydot=	wip/${PKGTAG.python-}pydot

include ../../mk/sysdep/python.mk

endif # PY_PYDOT_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
