# robotpkg sysdep/py-importlib-resources.mk
# Created:			Anthony Mallet on Thu Apr 21 2022
#
DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_IMPORTLIB_RESOURCES_DEPEND_MK:=	${PY_IMPORTLIB_RESOURCES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-importlib-resources
endif

ifeq (+,$(PY_IMPORTLIB_RESOURCES_DEPEND_MK)) # -----------------------------

PREFER.py-importlib-resources?=		system

# Note that this package is included in standard lib of python>=3.7
DEPEND_USE+=				py-importlib-resources

DEPEND_ABI.py-importlib-resources?=	${PKGTAG.python}-importlib-resources

SYSTEM_SEARCH.py-importlib-resources=\
  '${PYTHON_SYSLIBSEARCH}/importlib_resources/__init__.py'

include ../../mk/sysdep/python.mk

endif # PY_IMPORTLIB_RESOURCES_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
