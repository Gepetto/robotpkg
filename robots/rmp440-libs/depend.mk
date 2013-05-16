# robotpkg depend.mk for:	robots/rmp440-libs
# Created:			Matthieu Herrb on Thu, 16 May 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RMP440_LIBS_DEPEND_MK:=${RMP440_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rmp440-libs
endif

ifeq (+,$(RMP440_LIBS_DEPEND_MK))
PREFER.rmp440-libs?=	robotpkg

DEPEND_USE+=		rmp440-libs

DEPEND_ABI.rmp440-libs?=	rmp440-libs>=0.1
DEPEND_DIR.rmp440-libs?=	../../robots/rmp440-libs

SYSTEM_SEARCH.rmp440-libs=\
	bin/rmp440Joystick \
	include/rmp440/rmp440.h \
	lib/pkgconfig/rmp440-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
