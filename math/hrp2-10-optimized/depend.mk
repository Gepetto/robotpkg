# robotpkg depend.mk for:	math/hrp2-10-optimized
# Created:			Anthony Mallet on Mon, 17 Nov 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_10_OPTIMIZED_DEPEND_MK:=${HRP2_10_OPTIMIZED_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrp2-10-optimized
endif

ifeq (+,$(HRP2_10_OPTIMIZED_DEPEND_MK)) # --------------------------------

PREFER.hrp2-10-optimized?=	robotpkg

DEPEND_USE+=		hrp2-10-optimized

DEPEND_ABI.hrp2-10-optimized?=hrp2-10-optimized>=1.0.2
DEPEND_DIR.hrp2-10-optimized?=../../math/hrp2-10-optimized

SYSTEM_SEARCH.hrp2-10-optimized=\
	include/hrp2-10-optimized/hrp2-10-optimized.hh	\
	lib/pkgconfig/hrp2-10-optimized.pc

endif # HRP2_10_OPTIMIZED_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
