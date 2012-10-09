# robotpkg sysdep/py-paramiko.mk
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYPARAMIKO_DEPEND_MK:=	${PYPARAMIKO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-paramiko
endif

ifeq (+,$(PYPARAMIKO_DEPEND_MK)) # -----------------------------------------

PREFER.py-paramiko?=	system

DEPEND_USE+=		py-paramiko
DEPEND_ABI.py-paramiko?=${PKGTAG.python-}paramiko>=1

SYSTEM_SEARCH.py-paramiko=\
	'${PYTHON_SYSLIBSEARCH}/paramiko/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.py-paramiko=	PyPARAMIKO (python-${PYTHON_VERSION})
SYSTEM_PKG.Ubuntu.py-paramiko=	python-paramiko (python-${PYTHON_VERSION})
SYSTEM_PKG.Debian.py-paramiko=	python-paramiko (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-paramiko=	security/${PKGTAG.python-}paramiko

include ../../mk/sysdep/python.mk

endif # PYPARAMIKO_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
