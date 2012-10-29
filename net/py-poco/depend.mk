# robotpkg depend.mk for:	wip/py-poco
# Created:			Séverin Lemaignan on Tue, 9 Aug 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_POCO_DEPEND_MK:=	${PY_POCO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-poco
endif

ifeq (+,$(PY_POCO_DEPEND_MK)) # --------------------------------------------

PREFER.py-poco?=	robotpkg

DEPEND_USE+=		py-poco
DEPEND_ABI.py-poco?=	${PKGTAG.python}-poco>=1.4
DEPEND_DIR.py-poco?=	../../net/py-poco

SYSTEM_SEARCH.py-poco=\
	'${PYTHON_SYSLIBSEARCH}/pypoco.py:/__version__/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # PY_POCO_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
