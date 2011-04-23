# robotpkg depend.mk for:	mapping/regionMap-genom
# Created:			Arnaud Degroote on Fri, 28 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
REGIONMAPGENOM_DEPEND_MK:=	${REGIONMAPGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		regionMap-genom
endif

ifeq (+,$(REGIONMAPGENOM_DEPEND_MK))
PREFER.regionMap-genom?=	robotpkg

DEPEND_USE+=		regionMap-genom

DEPEND_ABI.regionMap-genom?=	regionMap-genom>=0.1
DEPEND_DIR.regionMap-genom?=	../../mapping/regionMap-genom

SYSTEM_SEARCH.regionMap-genom=\
	include/regionMap/regionMapStruct.h		\
	lib/pkgconfig/regionMap.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
