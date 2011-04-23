# robotpkg depend.mk for:	robots/fingers-genom
# Created:			Xavier Broquere on Fri, 18 March 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FINGERSGENOM_DEPEND_MK:=	${FINGERSGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		fingers-genom
endif

ifeq (+,$(FINGERSGENOM_DEPEND_MK))
PREFER.fingers-genom?=	robotpkg

DEPEND_USE+=		fingers-genom

DEPEND_ABI.fingers-genom?=	fingers-genom>=1.0
DEPEND_DIR.fingers-genom?=	../../robots/fingers-genom

SYSTEM_SEARCH.fingers-genom=\
	include/fingers/fingersStruct.h		\
	lib/pkgconfig/fingers.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
