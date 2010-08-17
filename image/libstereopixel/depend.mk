# robotpkg depend.mk for:	image/libstereopixel
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSTEREOPIXEL_DEPEND_MK:=${LIBSTEREOPIXEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libstereopixel
endif

ifeq (+,$(LIBSTEREOPIXEL_DEPEND_MK))
PREFER.libstereopixel?=	robotpkg

DEPEND_USE+=		libstereopixel

DEPEND_ABI.libstereopixel?=	libstereopixel>=1.3
DEPEND_DIR.libstereopixel?=	../../image/libstereopixel

SYSTEM_SEARCH.libstereopixel=\
	include/libstereopixel.h	\
	lib/pkgconfig/libstereopixel.pc
endif

include ../../image/libimages3d/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
