# robotpkg depend.mk for:	robots/rflex-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RFLEXGENOM_DEPEND_MK:=	${RFLEXGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rflex-genom
endif

ifeq (+,$(RFLEXGENOM_DEPEND_MK))
PREFER.rflex-genom?=	robotpkg

DEPEND_USE+=		rflex-genom

DEPEND_ABI.rflex-genom?=	rflex-genom>=0.3
DEPEND_DIR.rflex-genom?=	../../robots/rflex-genom

SYSTEM_SEARCH.rflex-genom=\
	include/rflex/rflexStruct.h		\
	lib/pkgconfig/rflex.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
