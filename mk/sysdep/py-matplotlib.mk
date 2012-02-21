# robotpkg sysdep/py-matplotlib.mk
# Created:			Anthony Mallet on Tue, 21 Feb 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_MATPLOTLIB_DEPEND_MK:=	${PY_MATPLOTLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-matplotlib
endif

ifeq (+,$(PY_MATPLOTLIB_DEPEND_MK)) # --------------------------------------

PREFER.py-matplotlib?=		system

DEPEND_USE+=			py-matplotlib
DEPEND_ABI.py-matplotlib?=	${PKGTAG.python-}matplotlib

SYSTEM_SEARCH.py-matplotlib=\
	'${PYTHON_SYSLIBSEARCH}/matplotlib/__init__.py'			\
	'${PYTHON_SYSLIBSEARCH}/matplotlib/backends/_gtkagg.so:::gtk'	\
	'${PYTHON_SYSLIBSEARCH}/matplotlib/backends/_tkagg.so:::tk'	\
	'${PYTHON_SYSLIBSEARCH}/matplotlib/backends/backend_wxagg.py:::wx'

SYSTEM_PKG.Debian.py-matplotlib=python-matplotlib (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-matplotlib=python-matplotlib-* (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-matplotlib=graphics/${PKGTAG.python-}matplotlib-*
SYSTEM_PKG.Ubuntu.py-matplotlib=python-matplotlib (python-${PYTHON_VERSION})

include ../../mk/sysdep/python.mk

endif # PY_MATPLOTLIB_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
