# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENPOSGENOM_DEPEND_MK:=	${GENPOSGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genPos-genom
endif

ifeq (+,$(GENPOSGENOM_DEPEND_MK))
PREFER.genPos-genom?=	robotpkg

DEPEND_USE+=		genPos-genom

DEPEND_ABI.genPos-genom?=	genPos-genom>=0.1
DEPEND_DIR.genPos-genom?=	../../architecture/genPos-genom

DEPEND_PKG_CONFIG.genPos-genom+=lib/pkgconfig

SYSTEM_SEARCH.genPos-genom=\
	include/genPos/genPosStruct.h		\
	lib/pkgconfig/genPos.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
