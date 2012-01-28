# robotpkg sysdep/py-wxpython.mk
# Created:			Anthony Mallet on Sat Jan 28 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_WXPYTHON_DEPEND_MK:=	${PY_WXPYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-wxpython
endif

ifeq (+,$(PY_WXPYTHON_DEPEND_MK)) # ----------------------------------------

PREFER.py-wxpython?=	system

DEPEND_USE+=		py-wxpython
DEPEND_ABI.py-wxpython?=${PKGTAG.python-}wxpython>=2.8

_pydir.py-wxpython=	${PYTHON_SYSLIBSEARCH}/wx-[0-9]*/wx
SYSTEM_SEARCH.py-wxpython=						\
	'${_pydir.py-wxpython}/__init__.py'				\
	'${_pydir.py-wxpython}/__version__.py:/VERSION_STRING/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.py-wxpython=	python-wxgtk2.8 (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-wxpython=	wxPython (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-wxpython=	x11/py-wxWidgets (python-${PYTHON_VERSION})
SYSTEM_PKG.Ubuntu.py-wxpython=	python-wxgtk2.8 (python-${PYTHON_VERSION})

include ../../mk/sysdep/python.mk

endif # PY_WXPYTHON_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
