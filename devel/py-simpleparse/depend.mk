# robotpkg depend.mk for:	devel/py-simpleparse
# Created:			Anthony Mallet on Thu, 9 Sep 2010
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_SIMPLEPARSE_DEPEND_MK:=	${PY_SIMPLEPARSE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-simpleparse
endif

ifeq (+,$(PY_SIMPLEPARSE_DEPEND_MK)) # -------------------------------------

PREFER.py-simpleparse?=	robotpkg

DEPEND_USE+=			py-simpleparse

DEPEND_ABI.py-simpleparse?=	py-simpleparse>=2.1.1
DEPEND_DIR.py-simpleparse?=	../../devel/py-simpleparse

SYSTEM_PKG.Ubuntu.py-simpleparse=	py-simpleparse

_pynamespec=python{2.6,2.5,2.4,[0-9].[0-9],}
SYSTEM_SEARCH.py-simpleparse=\
	'lib/${_pynamespec}/site-packages/simpleparse/__init__.py'

endif # PY_SIMPLEPARSE_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
