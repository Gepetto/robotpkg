# robotpkg sysdep/py-empy.mk
# Created:			Anthony Mallet on Sun Jul 15 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_EMPY_DEPEND_MK:=	${PY_EMPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-empy
endif

ifeq (+,$(PY_EMPY_DEPEND_MK)) # --------------------------------------------

PREFER.py-empy?=	system

DEPEND_USE+=		py-empy

DEPEND_ABI.py-empy?=	${PKGTAG.python}-empy>=3

SYSTEM_SEARCH.py-empy=\
  'bin/empy{-${PYTHON_VERSION},}:s/.*version[ ]*//p:% --version'	\
  '${PYTHON_SYSLIBSEARCH}/em.py'

SYSTEM_PKG.Debian.py-empy=	python-empy (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-empy=	python-empy (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-empy=	textproc/${PKGTAG.python}-empy
SYSTEM_PKG.Ubuntu.py-empy=	python-empy (python-${PYTHON_VERSION})

include ../../mk/sysdep/python.mk

export EMPY=	$(word 1,${SYSTEM_FILES.py-empy})

endif # PY_EMPY_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
