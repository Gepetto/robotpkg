# robotpkg sysdep/py-nose.mk
# Created:			Anthony Mallet on Sun Jul 15 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_NOSE_DEPEND_MK:=	${PY_NOSE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-nose
endif

ifeq (+,$(PY_NOSE_DEPEND_MK)) # --------------------------------------------

PREFER.py-nose?=	system

DEPEND_USE+=		py-nose

DEPEND_ABI.py-nose?=	${PKGTAG.python}-nose>=0.10

SYSTEM_SEARCH.py-nose=\
  'bin/nosetests{-${PYTHON_VERSION},}:s/.*version[ ]*//p:% --version'	\
  '${PYTHON_SYSLIBSEARCH}/nose/__init__.py'

SYSTEM_PKG.Debian.py-nose=	python-nose (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-nose=	python-nose (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-nose=	devel/${PKGTAG.python}-nose
SYSTEM_PKG.Ubuntu.py-nose=	python-nose (python-${PYTHON_VERSION})

include ../../mk/sysdep/python.mk

export NOSETESTS=	$(word 1,${SYSTEM_FILES.py-nose})

endif # PY_NOSE_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
