# robotpkg depend.mk for:	robots/rmp-libs
# Created:			Matthieu Herrb on Thu, 29 Apr 2010
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RMP_LIBS_DEPEND_MK:=${RMP_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rmp-libs
endif

ifeq (+,$(RMP_LIBS_DEPEND_MK))
PREFER.rmp-libs?=	robotpkg

DEPEND_USE+=		rmp-libs

DEPEND_ABI.rmp-libs?=	rmp-libs>=0.4
DEPEND_DIR.rmp-libs?=	../../robots/rmp-libs

SYSTEM_SEARCH.rmp-libs=\
	bin/rmpTest \
	include/rmp/rmpLib.h \
	lib/pkgconfig/rmp-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
