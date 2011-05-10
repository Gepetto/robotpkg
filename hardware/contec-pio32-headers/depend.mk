# robotpkg depend.mk for:	hardware/contec-pio32-headers
# Created:			Xavier Broquere on Tue, 10 May 2011
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
CONTEC_PIO32_HEADERS_DEPEND_MK:=	${CONTEC_PIO32_HEADERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			contec-pio32-headers
endif

ifeq (+,$(CONTEC_PIO32_HEADERS_DEPEND_MK)) # --------------------------------------

PREFER.contec-pio32-headers?=		robotpkg

DEPEND_USE+=			contec-pio32-headers
DEPEND_ABI.contec-pio32-headers?=	contec-pio32-headers>=1.0
DEPEND_DIR.contec-pio32-headers?=	../../hardware/contec-pio32-headers

SYSTEM_SEARCH.contec-pio32-headers=	\
	'include/contec_dio.h'


endif # CONTEC_PIO32_HEADERS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
