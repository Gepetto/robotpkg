# robotpkg depend.mk for:	localization/segloc-genom
# Created:			Arnaud Degroote on Mon, 9 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SEGLOCGENOM_DEPEND_MK:=	${SEGLOCGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		segloc-genom
endif

ifeq (+,$(SEGLOCGENOM_DEPEND_MK))
PREFER.segloc-genom?=	robotpkg

DEPEND_USE+=		segloc-genom

DEPEND_ABI.segloc-genom?=	segloc-genom>=0.3
DEPEND_DIR.segloc-genom?=	../../localization/segloc-genom

SYSTEM_SEARCH.segloc-genom=\
	include/segloc/seglocStruct.h		\
	lib/pkgconfig/segloc.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
