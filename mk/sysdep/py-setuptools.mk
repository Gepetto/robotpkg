# robotpkg sysdep/py-setuptools.mk
# Created:			Anthony Mallet on Thu,  9 Sep 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYSETUPTOOLS_DEPEND_MK:=${PYSETUPTOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-setuptools
endif

ifeq (+,$(PYSETUPTOOLS_DEPEND_MK)) # ---------------------------------------

PREFER.py-setuptools?=		system

DEPEND_USE+=			py-setuptools
DEPEND_ABI.py-setuptools?=	${PKGTAG.python-}setuptools

SYSTEM_SEARCH.py-setuptools=\
	'${PYTHON_SYSLIBSEARCH}/setuptools/__init__.py'

SYSTEM_PKG.Linux.py-setuptools=	python-setuptools (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-setuptools=pkgsrc/devel/${PKGTAG.python-}setuptools

include ../../mk/sysdep/python.mk
ifeq (Fedora,${OPSYS})
  ifneq (,$(filter 14,${OS_VERSION}))
    DEPEND_ABI.python+=	python{>=2.7<2.8,>=3.1<3.2}
  else
    DEPEND_ABI.python+=	python{>=2.7<2.8,>=3.2<3.3}
  endif
else ifeq (NetBSD,${OPSYS})
  DEPEND_ABI.python+=	python>=2.6<3
endif

endif # PYSETUPTOOLS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
