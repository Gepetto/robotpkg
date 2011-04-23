# robotpkg depend.mk for:	image/niut-genom
# Created:			Matthieu Herrb on Wed, 26 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NIUTGENOM_DEPEND_MK:=	${NIUTGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		niut-genom
endif

ifeq (+,$(NIUTGENOM_DEPEND_MK))
PREFER.niut-genom?=	robotpkg

DEPEND_USE+=		niut-genom

DEPEND_ABI.niut-genom?=	niut-genom>=0.1
DEPEND_DIR.niut-genom?=	../../image/niut-genom

SYSTEM_SEARCH.niut-genom=\
	include/niut/niutStruct.h		\
	lib/pkgconfig/niut.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
