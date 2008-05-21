# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PLATINEGENOM_DEPEND_MK:=	${PLATINEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		platine-genom
endif

ifeq (+,$(PLATINEGENOM_DEPEND_MK))
PREFER.platine-genom?=	robotpkg

DEPEND_USE+=		platine-genom

DEPEND_ABI.platine-genom?=	platine-genom>=0.1
DEPEND_DIR.platine-genom?=	../../robots/platine-genom

DEPEND_PKG_CONFIG.platine-genom+=lib/pkgconfig

SYSTEM_SEARCH.platine-genom=\
	include/platine/platineStruct.h		\
	lib/pkgconfig/platine.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
