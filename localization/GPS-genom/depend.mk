# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GPSGENOM_DEPEND_MK:=	${GPSGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		GPS-genom
endif

ifeq (+,$(GPSGENOM_DEPEND_MK))
PREFER.GPS-genom?=	robotpkg

DEPEND_USE+=		GPS-genom

DEPEND_ABI.GPS-genom?=	GPS-genom>=0.1
DEPEND_DIR.GPS-genom?=	../../localization/GPS-genom

DEPEND_PKG_CONFIG.GPS-genom+=lib/pkgconfig

SYSTEM_SEARCH.GPS-genom=\
	include/GPS/GPSStruct.h		\
	lib/pkgconfig/GPS.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
