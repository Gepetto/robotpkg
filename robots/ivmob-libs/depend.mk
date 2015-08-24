# robotpkg depend.mk for:	robots/ivmob-libs
# Created:			Matthieu Herrb on Sat, 22 Aug 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
IVMOB_LIBS_DEPEND_MK:=${IVMOB_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ivmob-libs
endif

ifeq (+,$(IVMOB_LIBS_DEPEND_MK))
PREFER.ivmob-libs?=	robotpkg

DEPEND_USE+=		ivmob-libs

DEPEND_ABI.ivmob-libs?=	ivmob-libs>=1.0
DEPEND_DIR.ivmob-libs?=	../../robots/ivmob-libs

SYSTEM_SEARCH.ivmob-libs=\
	bin/ivmobInfo \
	include/ivmob/ivmob.h \
	'lib/pkgconfig/ivmob-libs.pc:/Version/s/[^0-9.]//gp'
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
