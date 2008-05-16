# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBT3D_DEPEND_MK:=	${LIBT3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libt3d
endif

ifeq (+,$(LIBT3D_DEPEND_MK))
PREFER.libt3d?=	robotpkg

DEPEND_USE+=		libt3d

DEPEND_ABI.libt3d?=libt3d>=2.5
DEPEND_DIR.libt3d?=../../math/t3d

DEPEND_PKG_CONFIG.libt3d+=lib/pkgconfig

SYSTEM_SEARCH.libt3d=\
	include/t3d/t3d.h	\
	lib/pkgconfig/t3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
