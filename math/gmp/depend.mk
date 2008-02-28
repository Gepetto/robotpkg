# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GMP_DEPEND_MK:=		${GMP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gmp
endif

ifeq (+,$(GMP_DEPEND_MK))
PREFER.gmp?=		system

DEPEND_USE+=		gmp

DEPEND_ABI.gmp?=	gmp>=4.2.2
DEPEND_DIR.gmp?=	../../math/gmp

DEPEND_LIBS.gmp+=	-lgmp

SYSTEM_SEARCH.gmp=	\
	include/gmp.h	\
	lib/libgmp.so*
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
