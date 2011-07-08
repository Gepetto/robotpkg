# robotpkg depend.mk for:	robots/hrp2-10
# Created:			Florent Lamiraux, Fri Jul 8, 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_10_DEPEND_MK:=	${HRP2_10_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrp2-10
endif

ifeq (+,$(HRP2_10_DEPEND_MK)) # --------------------------------------

PREFER.hrp2-10?=	robotpkg

SYSTEM_SEARCH.hrp2-10=\
	include/hrp2_10/hrp2_10.h

DEPEND_USE+=		hrp2-10

DEPEND_ABI.hrp2-10?=	hrp2-10>=1.1
DEPEND_DIR.hrp2-10?=	../../robots/hrp2-10

endif # HRP2_10_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
