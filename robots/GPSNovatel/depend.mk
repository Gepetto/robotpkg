 $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GPSNOVATEL_DEPEND_MK:=${GPSNOVATEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		GPSNovatel
endif

ifeq (+,$(GPSNOVATEL_DEPEND_MK))
PREFER.GPSNovatel?=	robotpkg

DEPEND_USE+=		GPSNovatel

DEPEND_ABI.GPSNovatel?=	GPSNovatel>=1.0.1
DEPEND_DIR.GPSNovatel?=	../../robots/GPSNovatel

DEPEND_PKG_CONFIG.GPSNovatel+=lib/pkgconfig

SYSTEM_SEARCH.GPSNovatel=\
	include/GPSNovatel/GPSNovatel.h \
	lib/pkgconfig/GPSNovatel.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
