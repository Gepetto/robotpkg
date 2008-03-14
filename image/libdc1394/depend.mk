# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBDC1394_DEPEND_MK:=	${LIBDC1394_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libdc1394
endif

ifeq (+,$(LIBDC1394_DEPEND_MK))
PREFER.libdc1394?=	robotpkg

DEPEND_USE+=		libdc1394

DEPEND_ABI.libdc1394?=	libdc1394>=2.0.1
DEPEND_DIR.libdc1394?=	../../image/libdc1394

DEPEND_PKG_CONFIG.libdc1394+=lib/pkgconfig

SYSTEM_SEARCH.libdc1394=\
	include/dc1394/dc1394.h		\
	lib/pkgconfig/libdc1394-2.pc
endif

include ../../image/libraw1394/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
