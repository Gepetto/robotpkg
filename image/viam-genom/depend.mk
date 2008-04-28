# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VIAMGENOM_DEPEND_MK:=	${VIAMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		viam-genom
endif

ifeq (+,$(VIAMGENOM_DEPEND_MK))
PREFER.viam-genom?=	robotpkg

DEPEND_USE+=		viam-genom

DEPEND_ABI.viam-genom?=	viam-genom>=0.99
DEPEND_DIR.viam-genom?=	../../image/viam-genom

DEPEND_PKG_CONFIG.viam-genom+=lib/pkgconfig

SYSTEM_SEARCH.viam-genom=\
	include/viam/viamStruct.h		\
	lib/pkgconfig/viam.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
