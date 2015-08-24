# robotpkg depend.mk for:	robots/ivmob-genom
# Created:			Matthieu Herrb on Sat, 22 Aug 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
IVMOBGENOM_DEPEND_MK:=	${IVMOBGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ivmob-genom
endif

ifeq (+,$(IVMOBGENOM_DEPEND_MK))
PREFER.ivmob-genom?=	robotpkg

DEPEND_USE+=		ivmob-genom

DEPEND_ABI.ivmob-genom?=	ivmob-genom>=1.0
DEPEND_DIR.ivmob-genom?=	../../robots/ivmob-genom

SYSTEM_SEARCH.ivmob-genom=\
	include/ivmob/ivmobStruct.h		\
	'lib/pkgconfig/ivmob.pc:/Version/s/[^0-9.]//gp'

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
