# robotpkg depend.mk for:	path/ndd-genom
# Created:			Arnaud Degroote on Tue, 10 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NDDGENOM_DEPEND_MK:=	${NDDGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ndd-genom
endif

ifeq (+,$(NDDGENOM_DEPEND_MK))
PREFER.ndd-genom?=	robotpkg

DEPEND_USE+=		ndd-genom

DEPEND_ABI.ndd-genom?=	ndd-genom>=1.0
DEPEND_DIR.ndd-genom?=	../../path/ndd-genom

SYSTEM_SEARCH.ndd-genom=\
	include/ndd/nddStruct.h		\
	lib/pkgconfig/ndd.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
