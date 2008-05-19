# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
P3DGENOM_DEPEND_MK:=	${P3DGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		p3d-genom
endif

ifeq (+,$(P3DGENOM_DEPEND_MK))
PREFER.p3d-genom?=	robotpkg

DEPEND_USE+=		p3d-genom

DEPEND_ABI.p3d-genom?=	p3d-genom>=0.1
DEPEND_DIR.p3d-genom?=	../../path/p3d-genom

DEPEND_PKG_CONFIG.p3d-genom+=lib/pkgconfig

SYSTEM_SEARCH.p3d-genom=\
	include/p3d/p3dStruct.h		\
	lib/pkgconfig/p3d.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
