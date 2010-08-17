# robotpkg depend.mk for:	robots/jloco-genom
# Created:			Matthieu Herrb on Tue, 12 Jan 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JLOCOGENOM_DEPEND_MK:=	${JLOCOGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jloco-genom
endif

ifeq (+,$(JLOCOGENOM_DEPEND_MK))
PREFER.jloco-genom?=	robotpkg

DEPEND_USE+=		jloco-genom

DEPEND_ABI.jloco-genom?=	jloco-genom>=1.1r1
DEPEND_DIR.jloco-genom?=	../../robots/jloco-genom

SYSTEM_SEARCH.jloco-genom=\
	include/jloco/jlocoStruct.h		\
	lib/pkgconfig/jloco.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
