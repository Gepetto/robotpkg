# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BLAS_DEPEND_MK:=	${BLAS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		blas
endif

ifeq (+,$(BLAS_DEPEND_MK))
PREFER.blas?=		robotpkg

DEPEND_USE+=		blas

DEPEND_ABI.blas?=	blas>=1.0
DEPEND_DIR.blas?=	../../math/blas

DEPEND_LIBS.blas+=	-lblas

SYSTEM_SEARCH.blas=	\
	lib/libblas.*
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
