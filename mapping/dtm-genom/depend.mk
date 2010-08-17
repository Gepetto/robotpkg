# robotpkg depend.mk for:	mapping/dtm-genom
# Created:			Arnaud Degroote on Thu, 6 Aug 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DTMGENOM_DEPEND_MK:=	${DTMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dtm-genom
endif

ifeq (+,$(DTMGENOM_DEPEND_MK))
PREFER.dtm-genom?=	robotpkg

DEPEND_USE+=		dtm-genom

DEPEND_ABI.dtm-genom?=	dtm-genom>=1.1
DEPEND_DIR.dtm-genom?=	../../mapping/dtm-genom

SYSTEM_SEARCH.dtm-genom=\
	include/dtm/dtmStruct.h		\
	lib/pkgconfig/dtm.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
