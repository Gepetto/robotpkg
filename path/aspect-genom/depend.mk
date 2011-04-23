# robotpkg depend.mk for:	path/aspect-genom
# Created:			Arnaud Degroote on Tue, 10 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ASPECTGENOM_DEPEND_MK:=	${ASPECTGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		aspect-genom
endif

ifeq (+,$(ASPECTGENOM_DEPEND_MK))
PREFER.aspect-genom?=	robotpkg

DEPEND_USE+=		aspect-genom

DEPEND_ABI.aspect-genom?=	aspect-genom>=0.1
DEPEND_DIR.aspect-genom?=	../../path/aspect-genom

SYSTEM_SEARCH.aspect-genom=\
	include/aspect/aspectStruct.h		\
	lib/pkgconfig/aspect.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
