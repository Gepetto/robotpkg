 $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBP3D_DEPEND_MK:=${LIBP3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libp3d
endif

ifeq (+,$(LIBP3D_DEPEND_MK))
PREFER.libp3d?=	robotpkg

DEPEND_USE+=		libp3d

DEPEND_ABI.libp3d?=	libp3d>=1.0
DEPEND_DIR.libp3d?=	../../path/libp3d

DEPEND_PKG_CONFIG.libp3d+=lib/pkgconfig

SYSTEM_SEARCH.libp3d=\
	include/libp3d.h	\
	lib/pkgconfig/libp3d.pc
endif

include ../../math/t3d/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
