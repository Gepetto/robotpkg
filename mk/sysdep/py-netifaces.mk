# robotpkg sysdep/py-netifaces.mk
# Created:			Anthony Mallet on Set, 22 Jun 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_NETIFACES_DEPEND_MK:=	${PY_NETIFACES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-netifaces
endif

ifeq (+,$(PY_NETIFACES_DEPEND_MK)) # ---------------------------------------

PREFER.py-netifaces?=	system

DEPEND_USE+=		py-netifaces
DEPEND_ABI.py-netifaces?=${PKGTAG.python-}netifaces

SYSTEM_SEARCH.py-netifaces=\
	'${PYTHON_SYSLIBSEARCH}/netifaces.so'

SYSTEM_PKG.Fedora.py-netifaces=	python-netifaces (python-${PYTHON_VERSION})
SYSTEM_PKG.Ubuntu.py-netifaces=	python-netifaces (python-${PYTHON_VERSION})
SYSTEM_PKG.Debian.py-netifaces=	python-netifaces (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-netifaces=	net/${PKGTAG.python-}netifaces

include ../../mk/sysdep/python.mk

endif # PY_NETIFACES_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
