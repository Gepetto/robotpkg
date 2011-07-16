# robotpkg depend.mk for:	speech/dialogs
# Created:			Séverin Lemaignan on Wed, 9 Feb 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_DIALOGS_DEPEND_MK:=	${PY_DIALOGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-dialogs
endif

ifeq (+,$(PY_DIALOGS_DEPEND_MK)) # -----------------------------------------

PREFER.py-dialogs?=	robotpkg

DEPEND_USE+=		py-dialogs
DEPEND_ABI.py-dialogs?=	${PYPKGPREFIX}-dialogs>=0.5
DEPEND_DIR.py-dialogs?=	../../speech/dialogs
DEPEND_VARS.py-dialogs?=ALTERNATIVE.python

SYSTEM_SEARCH.py-dialogs=\
	'${PYTHON_SYSLIBSEARCH}/dialogs/__init__.py'

include ../../mk/sysdep/python.mk

endif # PY_DIALOGS_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
