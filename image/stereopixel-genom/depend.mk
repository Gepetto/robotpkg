# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
STEREOPIXELGENOM_DEPEND_MK:=	${STEREOPIXELGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		stereopixel-genom
endif

ifeq (+,$(STEREOPIXELGENOM_DEPEND_MK))
PREFER.stereopixel-genom?=	robotpkg

DEPEND_USE+=		stereopixel-genom

DEPEND_ABI.stereopixel-genom?=	stereopixel-genom>=1.1
DEPEND_DIR.stereopixel-genom?=	../../image/stereopixel-genom

DEPEND_PKG_CONFIG.stereopixel-genom+=lib/pkgconfig

SYSTEM_SEARCH.stereopixel-genom=\
	include/stereopixel/stereopixelStruct.h		\
	lib/pkgconfig/stereopixel.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
