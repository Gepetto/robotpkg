# robotpkg depend.mk for:	speech/gspeett
# Created:			Séverin Lemaignan on 8 Dec 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GSPEETT_DEPEND_MK:=	${GSPEETT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gspeett
endif

ifeq (+,$(GSPEETT_DEPEND_MK)) # --------------------------------------------

PREFER.gspeett?=	robotpkg

DEPEND_USE+=		gspeett
DEPEND_ABI.gspeett?=	gspeett>=1.1
DEPEND_DIR.gspeett?=	../../speech/gspeett

SYSTEM_SEARCH.py-gspeett=\
	'${PYTHON_SYSLIBSEARCH}/gspeett/__init__.py'

include ../../mk/sysdep/python.mk

endif # GSPEETT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
