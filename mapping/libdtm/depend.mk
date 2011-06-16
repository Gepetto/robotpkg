# robotpkg depend.mk for:	mapping/libdtm
# Created:			Arnaud Degroote on Thu, 6 Aug 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBDTM_DEPEND_MK:=	${LIBDTM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libdtm
endif

ifeq (+,$(LIBDTM_DEPEND_MK)) # ---------------------------------------
PREFER.libdtm?=	robotpkg

DEPEND_USE+=		libdtm

DEPEND_ABI.libdtm?=	libdtm>=1.3
DEPEND_DIR.libdtm?=	../../mapping/libdtm

SYSTEM_SEARCH.libdtm=\
	include/libdtm.h	\
	lib/pkgconfig/libdtm.pc

include ../../math/t3d/depend.mk
include ../../image/libimages3d/depend.mk

endif # LIBDTM_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
