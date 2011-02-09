# robotpkg depend.mk for:	speech/dialogs
# Created:			Séverin Lemaignan on Wed, 9 Feb 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DIALOGS_DEPEND_MK:=	${DIALOGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dialogs
endif

ifeq (+,$(DIALOGS_DEPEND_MK)) # -----------------------------------------------

PREFER.dialogs?=		robotpkg

DEPEND_USE+=		dialogs
DEPEND_ABI.dialogs?=	dialogs>=0.5
DEPEND_DIR.dialogs?=	../../speech/dialogs

DEPEND_PYTHONPATH.py-setuptools=\
	$(dir $(word 1,${SYSTEM_FILES.dialogs}))..

_pynamespec=python{2.6,2.5,2.4,[0-9].[0-9],}
SYSTEM_SEARCH.dialogs=\
	'lib/${_pynamespec}/{site,dist}-packages/dialogs/__init__.py'

endif # DIALOGS_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
