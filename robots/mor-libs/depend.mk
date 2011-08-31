# robotpkg depend.mk for:	robots/mor-libs
# Created:			Matthieu Herrb on Wed, 31 Aug 2011
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
MOR_LIBS_DEPEND_MK:=		${MOR_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			mor-libs
endif

ifeq (+,$(MOR_LIBS_DEPEND_MK))
PREFER.mor-libs?=		robotpkg

DEPEND_USE+=			mor-libs

DEPEND_ABI.mor-libs?=		mor-libs>=0.1
DEPEND_DIR.mor-libs?=		../../robots/mor-libs

SYSTEM_SEARCH.mor-libs= \
				include/mor/morLib.h \
				lib/libmor.la \
				lib/pkgconfig/mor-libs.pc
endif

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
