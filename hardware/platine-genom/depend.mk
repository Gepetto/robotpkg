# robotpkg depend.mk for:	hardware/platine-genom
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PLATINEGENOM_DEPEND_MK:=	${PLATINEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		platine-genom
endif

ifeq (+,$(PLATINEGENOM_DEPEND_MK))
PREFER.platine-genom?=	robotpkg

DEPEND_USE+=		platine-genom

DEPEND_ABI.platine-genom?=	platine-genom>=0.4
DEPEND_DIR.platine-genom?=	../../hardware/platine-genom

SYSTEM_SEARCH.platine-genom=\
	include/platine/platineStruct.h		\
	lib/pkgconfig/platine.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
