# robotpkg depend.mk for:	interfaces/genHum-genom
# Created:			Xavier BROQUERE on Tue, 09 Nov 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENHUMGENOM_DEPEND_MK:=	${GENHUMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genHum-genom
endif

ifeq (+,$(GENHUMGENOM_DEPEND_MK))
PREFER.genHum-genom?=	robotpkg

DEPEND_USE+=		genHum-genom

DEPEND_ABI.genHum-genom?=	genHum-genom>=1.1
DEPEND_DIR.genHum-genom?=	../../interfaces/genHum-genom

SYSTEM_SEARCH.genHum-genom=\
	include/genHum/genHumStruct.h		\
	lib/pkgconfig/genHum.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
