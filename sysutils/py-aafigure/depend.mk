# robotpkg depend.mk for:	sysutils/py-aafigure
# Created:			Anthony Mallet on Mon, 26 Nov 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_AAFIGURE_DEPEND_MK:=	${PY_AAFIGURE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-aafigure
endif

ifeq (+,$(PY_AAFIGURE_DEPEND_MK)) # ----------------------------------------

PREFER.py-aafigure?=	system

DEPEND_USE+=		py-aafigure

DEPEND_ABI.py-aafigure?=${PKGTAG.python}-aafigure>=0.5
DEPEND_DIR.py-aafigure?=../../sysutils/py-aafigure

SYSTEM_PKG.Debian.py-aafigure=	python-aafigure
SYSTEM_PKG.Fedora.py-aafigure=	python-aafigure
SYSTEM_PKG.Ubuntu.py-aafigure=	python-aafigure
SYSTEM_PKG.NetBSD.py-aafigure=	graphics/py-aafigure

SYSTEM_SEARCH.py-aafigure=\
	'bin/aafigure:/^aafigure/s/[^0-9.]//gp:% --version'	\
	'${PYTHON_SYSLIBSEARCH}/aafigure/__init__.py'

include ../../mk/sysdep/python.mk

endif # PY_AAFIGURE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
