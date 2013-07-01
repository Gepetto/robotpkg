# robotpkg sysdep/py-sphinx.mk
# Created:			Anthony Mallet on Thu, 31 Mar 2011
#

# Sphinx is a tool that makes it easy to create intelligent and beautiful
# documentation for Python projects (or other documents consisting of multiple
# reStructuredText sources).

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_SPHINX_DEPEND_MK:=		${PY_SPHINX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-sphinx
endif

ifeq (+,$(PY_SPHINX_DEPEND_MK)) # ------------------------------------------

PREFER.py-sphinx?=		system

DEPEND_USE+=			py-sphinx
DEPEND_ABI.py-sphinx?=		${PKGTAG.python}-sphinx>=0.6
DEPEND_METHOD.py-sphinx?=	build

SYSTEM_SEARCH.py-sphinx=\
	'bin/sphinx-build:1s/[^0-9.]//gp:% -_'			\
	'${PYTHON_SYSLIBSEARCH}/sphinx/__init__.py'

SYSTEM_PKG.Linux.py-sphinx=	python-sphinx (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-sphinx=	textproc/${PKGTAG.python}-sphinx

include ../../mk/sysdep/python.mk

endif # PY_SPHINX_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
