# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GDHE_DEPEND_MK:=${GDHE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gdhe
endif

ifeq (+,$(GDHE_DEPEND_MK))
PREFER.gdhe?=	robotpkg

DEPEND_USE+=		gdhe

DEPEND_ABI.gdhe?=	gdhe>=3.6
DEPEND_DIR.gdhe?=	../../graphics/gdhe

DEPEND_PKG_CONFIG.gdhe+=lib/pkgconfig

SYSTEM_SEARCH.gdhe=\
	include/gdhe/GDHE.h	\
	lib/pkgconfig/gdhe.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
