# robotpkg depend.mk for:	hardware/sranger-genom
# Created:			Matthieu Herrb on Fri, 27 Aug 2010
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
SRANGERGENOM_DEPEND_MK:=	${SRANGERGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			sranger-genom
endif

ifeq (+,$(SRANGERGENOM_DEPEND_MK))
PREFER.sranger-genom?=		robotpkg

DEPEND_USE+=			sranger-genom

DEPEND_ABI.sranger-genom?=	sranger-genom>=0.1
DEPEND_DIR.sranger-genom?=	../../hardware/sranger-genom

SYSTEM_SEARCH.sranger-genom=\
	include/sranger/srangerStruct.h		\
	lib/pkgconfig/sranger.pc
endif

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
