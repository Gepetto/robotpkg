# robotpkg sysdep/py-future.mk
# Created:			Anthony Mallet on Thu Jul 25 2019
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_FUTURE_DEPEND_MK:=	${PY_FUTURE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-future
endif

ifeq (+,$(PY_FUTURE_DEPEND_MK)) # --------------------------------------------

PREFER.py-future?=	system

DEPEND_USE+=		py-future

DEPEND_ABI.py-future?=	${PKGTAG.python}-future

SYSTEM_SEARCH.py-future=\
  '${PYTHON_SYSLIBSEARCH}/future/__init__.py'

SYSTEM_PKG.RedHat.py-future=	python-future (python-${PYTHON_VERSION})
SYSTEM_PKG.Debian.py-future=	python-future (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-future=	devel/${PKGTAG.python}-future
SYSTEM_PKG.Ubuntu.py-future=	python-future (python-${PYTHON_VERSION})

include ../../mk/sysdep/python.mk

DEPEND_ABI.python+=	python<3

endif # PY_FUTURE_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
