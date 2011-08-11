# robotpkg depend.mk for:	knowledge/py-oro
# Created:			Séverin Lemaignan on Fri, 5 Aug 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_ORO_DEPEND_MK:=	${PY_ORO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-oro
endif

ifeq (+,$(PY_ORO_DEPEND_MK)) # ---------------------------------------------

PREFER.py-oro?=		robotpkg

DEPEND_USE+=		py-oro
DEPEND_ABI.py-oro?=	${PKGTAG.python-}oro>=1.0
DEPEND_DIR.py-oro?=	../../knowledge/py-oro

SYSTEM_SEARCH.py-oro=	'${PYTHON_SYSLIBSEARCH}/pyoro.py'

include ../../mk/sysdep/python.mk

endif # PY_ORO_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
