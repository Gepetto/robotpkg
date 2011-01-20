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

USE_LANGUAGES+=			python

DEPEND_USE+=			py-setuptools
DEPEND_ABI.py-setuptools?=	py-setuptools

DEPEND_PYTHONPATH.py-setuptools=\
	$(dir $(word 2,${SYSTEM_FILES.py-setuptools}))..

_pynamespec=python{2.6,2.5,2.4,[0-9].[0-9],}
SYSTEM_SEARCH.py-setuptools=\
	'bin/${_pynamespec}:s/[^.0-9]//gp:% --version'			\
	'lib/${_pynamespec}/{site,dist}-packages/setuptools/__init__.py'

SYSTEM_PKG.Linux.py-setuptools=	python-setuptools
SYSTEM_PKG.NetBSD.py-setuptools=pkgsrc/devel/py-setuptools

endif # PYSETUPTOOLS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
