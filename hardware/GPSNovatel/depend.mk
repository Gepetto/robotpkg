# robotpkg depend.mk for:	hardware/GPSNovatel
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GPSNOVATEL_DEPEND_MK:=${GPSNOVATEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		GPSNovatel
endif

ifeq (+,$(GPSNOVATEL_DEPEND_MK))
PREFER.GPSNovatel?=	robotpkg

DEPEND_USE+=		GPSNovatel

DEPEND_ABI.GPSNovatel?=	GPSNovatel>=1.4
DEPEND_DIR.GPSNovatel?=	../../hardware/GPSNovatel

SYSTEM_SEARCH.GPSNovatel=\
	include/GPSNovatel/GPSNovatel.h \
	lib/pkgconfig/GPSNovatel.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
