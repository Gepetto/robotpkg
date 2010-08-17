# robotpkg depend.mk for:	mapping/mapkit
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MAPKIT_DEPEND_MK:=	${MAPKIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mapkit
endif

ifeq (+,$(MAPKIT_DEPEND_MK))
PREFER.mapkit?=	robotpkg

DEPEND_USE+=		mapkit

DEPEND_ABI.mapkit?=	mapkit>=1.0
DEPEND_DIR.mapkit?=	../../mapping/mapkit

SYSTEM_SEARCH.mapkit=\
	include/mapkit/api_P.h \
	lib/pkgconfig/mapkit.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
