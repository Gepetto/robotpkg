# robotpkg depend.mk for:	mapping/regionMap-lib
# Created:			Arnaud Degroote on Fri, 28 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
REGIONMAP_LIB_DEPEND_MK:=	${REGIONMAP_LIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		regionMap-lib
endif

ifeq (+,$(REGIONMAP_LIB_DEPEND_MK)) # ---------------------------------------
PREFER.regionMap-lib?=	robotpkg

DEPEND_USE+=		regionMap-lib

DEPEND_ABI.regionMap-lib?=	regionMap-lib>=0.1
DEPEND_DIR.regionMap-lib?=	../../mapping/regionMap-lib

SYSTEM_SEARCH.regionMap-lib=\
	include/libregionMap.h	\
	lib/pkgconfig/libregionMap.pc

include ../../math/t3d/depend.mk
include ../../image/libimages3d/depend.mk

endif # REGIONMAP_LIB_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
