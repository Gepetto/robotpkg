# robotpkg depend.mk for:	robots/mor-genom
# Created:			Matthieu Herrb on Tue, 12 Jan 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MORGENOM_DEPEND_MK:=	${MORGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mor-genom
endif

ifeq (+,$(MORGENOM_DEPEND_MK))
PREFER.mor-genom?=	robotpkg

DEPEND_USE+=		mor-genom

DEPEND_ABI.mor-genom?=	mor-genom>=0.1
DEPEND_DIR.mor-genom?=	../../robots/mor-genom

SYSTEM_SEARCH.mor-genom=\
	include/mor/morStruct.h		\
	lib/pkgconfig/mor.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
