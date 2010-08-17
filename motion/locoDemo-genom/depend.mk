# robotpkg depend.mk for:	motion/locoDemo-genom
# Created:			Matthieu Herrb on Tue, 12 Jan 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LOCODEMOGENOM_DEPEND_MK:=	${LOCODEMOGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		locoDemo-genom
endif

ifeq (+,$(LOCODEMOGENOM_DEPEND_MK))
PREFER.locoDemo-genom?=	robotpkg

DEPEND_USE+=		locoDemo-genom

DEPEND_ABI.locoDemo-genom?=	locoDemo-genom>=1.2r1
DEPEND_DIR.locoDemo-genom?=	../../motion/locoDemo-genom

SYSTEM_SEARCH.locoDemo-genom=\
	include/locoDemo/locoDemoStruct.h		\
	lib/pkgconfig/locoDemo.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
