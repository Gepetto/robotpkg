# $Id: depend.mk 2008/04/04 19:11:07 mallet $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LAPACK_DEPEND_MK:=	${LAPACK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		lapack
endif

ifeq (+,$(LAPACK_DEPEND_MK))
PREFER.lapack?=		robotpkg

DEPEND_USE+=		lapack

DEPEND_ABI.lapack?=	lapack>=3.1.0
DEPEND_DIR.lapack?=	../../math/lapack

DEPEND_LIBS.lapack+=	-llapack

SYSTEM_SEARCH.blas=	\
	lib/liblapack.*
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
