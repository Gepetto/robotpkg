# $Id: depend.mk 2008/10/22 18:41:01 mallet $

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

SYSTEM_SEARCH.lapack=	\
	'lib/liblapack.*'
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
