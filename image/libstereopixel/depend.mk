# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSTEREOPIXEL_DEPEND_MK:=${LIBSTEREOPIXEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libstereopixel
endif

ifeq (+,$(LIBSTEREOPIXEL_DEPEND_MK))
PREFER.libstereopixel?=	robotpkg

DEPEND_USE+=		libstereopixel

DEPEND_ABI.libstereopixel?=	libstereopixel>=1.1
DEPEND_DIR.libstereopixel?=	../../image/libstereopixel

DEPEND_PKG_CONFIG.libstereopixel+=lib/pkgconfig

SYSTEM_SEARCH.libstereopixel=\
	include/libstereopixel.h	\
	lib/pkgconfig/libstereopixel.pc
endif

include ../../image/libimages3d/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
