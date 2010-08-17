# robotpkg depend.mk for:	sysutils/y2l
# Created:			Anthony Mallet on Fri, 23 Apr 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
Y2L_DEPEND_MK:=		${Y2L_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		y2l
endif

ifeq (+,$(Y2L_DEPEND_MK)) # ------------------------------------------------

PREFER.y2l?=		robotpkg

DEPEND_USE+=		y2l
DEPEND_ABI.y2l?=	y2l>=1.0

SYSTEM_SEARCH.y2l=	bin/y2l

endif # Y2L_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
