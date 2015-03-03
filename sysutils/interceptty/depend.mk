# robotpkg depend.mk for:	sysutils/interceptty
# Created:			Anthony Mallet on Tue,  3 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
INTERCEPTTY_DEPEND_MK:=	${INTERCEPTTY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		interceptty
endif

ifeq (+,$(INTERCEPTTY_DEPEND_MK)) # ----------------------------------------

PREFER.interceptty?=	robotpkg

DEPEND_USE+=		interceptty

DEPEND_ABI.interceptty?=interceptty>=0.6
DEPEND_DIR.interceptty?=../../sysutils/interceptty

SYSTEM_SEARCH.interceptty=\
  'bin/interceptty:p:% -V'

endif # INTERCEPTTY_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
