# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
T3D_DEPEND_MK:=	${T3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		t3d
endif

ifeq (+,$(T3D_DEPEND_MK))
PREFER.t3d?=	robotpkg

DEPEND_USE+=		t3d

DEPEND_ABI.t3d?=t3d>=2.5
DEPEND_DIR.t3d?=../../math/t3d

DEPEND_PKG_CONFIG.t3d+=lib/pkgconfig

SYSTEM_SEARCH.t3d=\
	include/t3d/t3d.h	\
	lib/pkgconfig/t3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
