# robotpkg depend.mk for:	robots/libmesasr
# Created:			Matthieu Herrb on Thu, 29 Apr 2010
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBMESASR_DEPEND_MK:=${LIBMESASR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libmesasr
endif

ifeq (+,$(LIBMESASR_DEPEND_MK))
PREFER.libmesasr?=	robotpkg

DEPEND_USE+=		libmesasr

DEPEND_ABI.libmesasr?=	libmesasr>=1.0.14
DEPEND_DIR.libmesasr?=	../../hardware/libmesasr

SYSTEM_SEARCH.libmesasr=\
	include/libMesaSR.h \
	lib/libmesasr.so.1.0.14
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
