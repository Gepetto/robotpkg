# robotpkg sysdep/py-argcomplete.mk
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_ARGCOMPLETE_DEPEND_MK:=	${PY_ARGCOMPLETE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-argcomplete
endif

ifeq (+,$(PY_ARGCOMPLETE_DEPEND_MK)) # -------------------------------------

PREFER.py-argcomplete?=		system

DEPEND_USE+=			py-argcomplete
DEPEND_ABI.py-argcomplete?=	${PKGTAG.python-}argcomplete

SYSTEM_SEARCH.py-argcomplete=\
  '${PYTHON_SYSLIBSEARCH}/argcomplete/__init__.py'

SYSTEM_PKG.py-argcomplete=	python${PYTHON_MAJOR}-argcomplete
SYSTEM_PKG.NetBSD.py-argcomplete=devel/${PKGTAG.python-}argcomplete

include ../../mk/sysdep/python.mk

endif # PY_ARGCOMPLETE_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
