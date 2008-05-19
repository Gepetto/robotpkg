# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RFLEXGENOM_DEPEND_MK:=	${RFLEXGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rflex-genom
endif

ifeq (+,$(RFLEXGENOM_DEPEND_MK))
PREFER.rflex-genom?=	robotpkg

DEPEND_USE+=		rflex-genom

DEPEND_ABI.rflex-genom?=	rflex-genom>=0.2
DEPEND_DIR.rflex-genom?=	../../localization/rflex-genom

DEPEND_PKG_CONFIG.rflex-genom+=lib/pkgconfig

SYSTEM_SEARCH.rflex-genom=\
	include/rflex/rflexStruct.h		\
	lib/pkgconfig/rflex.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
