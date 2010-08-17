# robotpkg depend.mk for:	math/mpfr
# Created:			Anthony Mallet on Thu, 28 Feb 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MPFR_DEPEND_MK:=	${MPFR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mpfr
endif

ifeq (+,$(MPFR_DEPEND_MK))
PREFER.mpfr?=		system

DEPEND_USE+=		mpfr

DEPEND_ABI.mpfr?=	mpfr>=2.3.1
DEPEND_DIR.mpfr?=	../../math/mpfr

DEPEND_LIBS.mpfr+=	-lmpfr

SYSTEM_SEARCH.mpfr=	\
	include/mpfr.h	\
	lib/libmpfr.so*
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
