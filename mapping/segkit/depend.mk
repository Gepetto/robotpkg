# robotpkg depend.mk for:	robots/segkit
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SEGKIT_DEPEND_MK:=	${SEGKIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		segkit
endif

ifeq (+,$(SEGKIT_DEPEND_MK))
PREFER.segkit?=	robotpkg

DEPEND_USE+=		segkit

DEPEND_ABI.segkit?=	segkit>=1.0
DEPEND_DIR.segkit?=	../../mapping/segkit

SYSTEM_SEARCH.segkit=\
	include/segkit/lasdef.h \
	lib/pkgconfig/segkit.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
