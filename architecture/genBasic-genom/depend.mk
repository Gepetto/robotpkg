# robotpkg depend.mk for:	architecture/genBasic-genom
# Created:			A. degroote on Sat, 17 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENBASICGENOM_DEPEND_MK:=	${GENBASICGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genBasic-genom
endif

ifeq (+,$(GENBASICGENOM_DEPEND_MK))
PREFER.genBasic-genom?=	robotpkg

DEPEND_USE+=		genBasic-genom

DEPEND_ABI.genBasic-genom?=	genBasic-genom>=0.1
DEPEND_DIR.genBasic-genom?=	../../architecture/genBasic-genom

SYSTEM_SEARCH.genBasic-genom=\
	include/genBasic/genBasicStruct.h		\
	lib/pkgconfig/genBasic.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
