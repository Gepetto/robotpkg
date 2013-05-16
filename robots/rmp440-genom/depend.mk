# robotpkg depend.mk for:	robots/rmp440-genom
# Created:			Matthieu Herrb on Thu, 16 May 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RMP440GENOM_DEPEND_MK:=	${RMP440GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rmp440-genom
endif

ifeq (+,$(RMP440GENOM_DEPEND_MK))
PREFER.rmp440-genom?=	robotpkg

DEPEND_USE+=		rmp440-genom

DEPEND_ABI.rmp440-genom?=	rmp440-genom>=0.1
DEPEND_DIR.rmp440-genom?=	../../robots/rmp440-genom

SYSTEM_SEARCH.rmp440-genom=\
	include/rmp440/rmp440Struct.h		\
	lib/pkgconfig/rmp440.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
