# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VIAMLIBS_DEPEND_MK:=	${VIAMLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		viam-libs
endif

ifeq (+,$(VIAMLIBS_DEPEND_MK))
PREFER.viam-libs?=	robotpkg

DEPEND_USE+=		viam-libs

DEPEND_ABI.viam-libs?=	viam-libs>=1.0
DEPEND_DIR.viam-libs?=	../../image/viam-libs

DEPEND_PKG_CONFIG.viam-libs+=lib/pkgconfig

SYSTEM_SEARCH.viam-libs=\
	include/viamlib.h		\
	lib/pkgconfig/viam-libs.pc
endif

include ../../image/libdc1394/depend.mk
include ../../image/opencv/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
