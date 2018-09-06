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
DEPEND_ABI.py-sphinx?=		py-sphinx>=1.1
DEPEND_METHOD.py-sphinx?=	build

# sphinx-apidoc for python code needs a python compatible with the code (sigh).
# To keep it simple, this requirement is transformed as follow:
#  - require the _same_ python version as the package if python is used
#  - don't care about python if python is not otherwise used
#
# `sphinx-build -_` will exit 1 because _ is an invalid option, but this is the
# only way to have sphinx report its version number. We should ignore the error
# with something like "||:", but colons are reserved for IFS in a SYSTEM_SEARCH
# specification.
#
SYSTEM_SEARCH.py-sphinx=\
  'bin/sphinx-build{,{,-}[0-9]*}:1s/.* [^0-9.]*//p:{ % --version || dum=; }'\
  'bin/sphinx-apidoc{,{,-}[0-9]*}'					\
  $(if ${PYTHON_DEPEND_MK},'${PYTHON_SYSLIBSEARCH}/sphinx/__init__.py')

_py-sphinx-pyver=$(if ${PYTHON_DEPEND_MK}, (python-${PYTHON_VERSION}))

SYSTEM_PKG.Debian.py-sphinx=	python$(filter-out 2,${PYTHON_MAJOR})-sphinx
SYSTEM_PKG.Fedora.py-sphinx=	python${_py-sphinx-pyver}-sphinx
SYSTEM_PKG.Gentoo.py-sphinx=	python-sphinx${_py-sphinx-pyver}
SYSTEM_PKG.NetBSD.py-sphinx=\
  textproc/$(if ${PYTHON_DEPEND_MK},${PKGTAG.python},py)-sphinx

export SPHINX_BUILD=$(word 1,${SYSTEM_FILES.py-sphinx})

endif # PY_SPHINX_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
