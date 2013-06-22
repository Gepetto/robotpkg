# robotpkg sysdep/py-imaging.mk
# Created:			Anthony Mallet on Set, 22 Jun 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_IMAGING_DEPEND_MK:=	${PY_IMAGING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-imaging
endif

ifeq (+,$(PY_IMAGING_DEPEND_MK)) # -----------------------------------------

PREFER.py-imaging?=	system

DEPEND_USE+=		py-imaging
DEPEND_ABI.py-imaging?=	${PKGTAG.python-}imaging

SYSTEM_SEARCH.py-imaging=\
	'${PYTHON_SYSLIBSEARCH}/PIL/__init__.py'

SYSTEM_PKG.Fedora.py-imaging=	python-imaging (python-${PYTHON_VERSION})
SYSTEM_PKG.Ubuntu.py-imaging=	python-imaging (python-${PYTHON_VERSION})
SYSTEM_PKG.Debian.py-imaging=	python-imaging (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-imaging=	graphics/${PKGTAG.python-}imaging

include ../../mk/sysdep/python.mk

endif # PY_IMAGING_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
