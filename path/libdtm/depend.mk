 $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBDTM_DEPEND_MK:=${LIBDTM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libdtm
endif

ifeq (+,$(LIBDTM_DEPEND_MK))
PREFER.libdtm?=	robotpkg

DEPEND_USE+=		libdtm

DEPEND_ABI.libdtm?=	libdtm>=1.0
DEPEND_DIR.libdtm?=	../../path/libdtm

DEPEND_PKG_CONFIG.libdtm+=lib/pkgconfig

SYSTEM_SEARCH.libdtm=\
	include/libdtm.h	\
	lib/pkgconfig/libdtm.pc
endif

include ../../math/t3d/depend.mk
include ../../image/libimages3d/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
