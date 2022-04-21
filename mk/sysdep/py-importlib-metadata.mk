# robotpkg sysdep/py-importlib-metadata.mk
# Created:			Anthony Mallet on Thu Apr 21 2022
#
DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_IMPORTLIB_METADATA_DEPEND_MK:=	${PY_IMPORTLIB_METADATA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-importlib-metadata
endif

ifeq (+,$(PY_IMPORTLIB_METADATA_DEPEND_MK)) # ------------------------------

PREFER.py-importlib-metadata?=		system

# Note that this package is included in standard lib of python>=3.8
DEPEND_USE+=				py-importlib-metadata

DEPEND_ABI.py-importlib-metadata?=	${PKGTAG.python}-importlib-metadata

SYSTEM_SEARCH.py-importlib-metadata=\
  '${PYTHON_SYSLIBSEARCH}/importlib_metadata/__init__.py'

include ../../mk/sysdep/python.mk

endif # PY_IMPORTLIB_METADATA_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
