# robotpkg depend.mk for:	localization/GPS-genom
# Created:			Arnaud Degroote on Tue, 20 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GPSGENOM_DEPEND_MK:=	${GPSGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		GPS-genom
endif

ifeq (+,$(GPSGENOM_DEPEND_MK))
PREFER.GPS-genom?=	robotpkg

DEPEND_USE+=		GPS-genom

DEPEND_ABI.GPS-genom?=	GPS-genom>=1.2
DEPEND_DIR.GPS-genom?=	../../localization/GPS-genom

SYSTEM_SEARCH.GPS-genom=\
	include/GPS/GPSStruct.h		\
	lib/pkgconfig/GPS.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
