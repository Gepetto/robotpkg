# robotpkg depend.mk for:	hardware/force-genom
# Created:			Nizar Khalifa Sallem on Tue, 28 Jul 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FORCEGENOM_DEPEND_MK:=	${FORCEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		force-genom
endif

ifeq (+,$(FORCEGENOM_DEPEND_MK))
PREFER.force-genom?=	robotpkg

DEPEND_USE+=		force-genom

DEPEND_ABI.force-genom?=	force-genom>=1.1
DEPEND_DIR.force-genom?=	../../hardware/force-genom

SYSTEM_SEARCH.force-genom=\
	include/force/forceStruct.h		\
	lib/pkgconfig/force.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
