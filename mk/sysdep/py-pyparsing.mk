# robotpkg sysdep/py-pyparsing.mk
# Created:			Anthony Mallet on Wed Oct 30 2019
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_PYPARSING_DEPEND_MK:=${PY_PYPARSING_DEPEND_MK}+

include ../../mk/sysdep/python.mk

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		py-pyparsing
endif

ifeq (+,$(PY_PYPARSING_DEPEND_MK)) # ---------------------------------------

PREFER.py-pyparsing?=	system

DEPEND_USE+=		py-pyparsing

DEPEND_ABI.py-pyparsing?=	${PKGTAG.python}-pyparsing>=1

SYSTEM_SEARCH.py-pyparsing=\
  '${PYTHON_SYSLIBSEARCH}/pyparsing.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.py-pyparsing=	python-pyparsing (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-pyparsing=	python-pyparsing (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-pyparsing=	devel/${PKGTAG.python}-pyparsing
SYSTEM_PKG.Ubuntu.py-pyparsing=	python-pyparsing (python-${PYTHON_VERSION})

endif # PY_PYPARSING_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
