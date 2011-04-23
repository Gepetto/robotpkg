# robotpkg depend.mk for:	robots/rmp400-genom
# Created:			Matthieu Herrb on Thu, 29 Apr 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RMP400GENOM_DEPEND_MK:=	${RMP400GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rmp400-genom
endif

ifeq (+,$(RMP400GENOM_DEPEND_MK))
PREFER.rmp400-genom?=	robotpkg

DEPEND_USE+=		rmp400-genom

DEPEND_ABI.rmp400-genom?=	rmp400-genom>=0.1
DEPEND_DIR.rmp400-genom?=	../../robots/rmp400-genom

SYSTEM_SEARCH.rmp400-genom=\
	include/rmp400/rmp400Struct.h		\
	lib/pkgconfig/rmp400.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
