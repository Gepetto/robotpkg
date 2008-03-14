# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBRAW1394_DEPEND_MK:=	${LIBRAW1394_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libraw1394
endif

ifeq (+,$(LIBRAW1394_DEPEND_MK))
PREFER.libraw1394?=	robotpkg

DEPEND_USE+=		libraw1394

DEPEND_ABI.libraw1394?=	libraw1394>=1.3.0
DEPEND_DIR.libraw1394?=	../../image/libraw1394

DEPEND_PKG_CONFIG.libraw1394+=lib/pkgconfig

SYSTEM_SEARCH.libraw1394=\
	include/libraw1394/raw1394.h	\
	lib/pkgconfig/libraw1394.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
