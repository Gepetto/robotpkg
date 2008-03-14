# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBIMAGES3D_DEPEND_MK:=	${LIBIMAGES3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libimages3d
endif

ifeq (+,$(LIBIMAGES3D_DEPEND_MK))
PREFER.libimages3d?=	robotpkg

DEPEND_USE+=		libimages3d

DEPEND_ABI.libimages3d?=libimages3d>=3.1
DEPEND_DIR.libimages3d?=../../image/libimages3d

DEPEND_PKG_CONFIG.libimages3d+=lib/pkgconfig

SYSTEM_SEARCH.libimages3d=\
	include/libimages3d.h	\
	lib/pkgconfig/libimages3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
