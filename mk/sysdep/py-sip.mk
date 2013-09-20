# robotpkg sysdep/py-sip.mk
# Created:			Anthony Mallet on Fri Jun 28 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_SIP_DEPEND_MK:=	${PY_SIP_DEPEND_MK}+

include ../../mk/sysdep/python.mk

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		py-sip
endif

ifeq (+,$(PY_SIP_DEPEND_MK)) # ---------------------------------------------

PREFER.py-sip?=		system

DEPEND_USE+=		py-sip

DEPEND_METHOD.py-sip?=	build
DEPEND_ABI.py-sip?=	${PKGTAG.python}-sip>=4

SYSTEM_SEARCH.py-sip=\
  'bin/sip{${PYTHON_VERSION},}:p:% -V'					\
  'include/python${PYTHON_VERSION}/sip.h:/VERSION_STR/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/sip.so'

SYSTEM_PKG.Debian.py-sip=	python-sip-dev (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-sip=	sip-devel (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-sip=	x11/${PKGTAG.python}-sip
SYSTEM_PKG.Ubuntu.py-sip=	python-sip-dev (python-${PYTHON_VERSION})
SYSTEM_PKG.Gentoo.py-sip=	dev-python/sip (python-${PYTHON_VERSION})

export SIP=		$(word 1,${SYSTEM_FILES.py-sip})

endif # PY_SIP_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
