# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOMGENOM_DEPEND_MK:=	${GENOMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyro-genom
endif

ifeq (+,$(GENOMGENOM_DEPEND_MK))
PREFER.gyro-genom?=	robotpkg

DEPEND_USE+=		gyro-genom

DEPEND_ABI.gyro-genom?=	gyro-genom>=0.1
DEPEND_DIR.gyro-genom?=	../../localization/gyro-genom

DEPEND_PKG_CONFIG.gyro-genom+=lib/pkgconfig

SYSTEM_SEARCH.gyro-genom=\
	include/gyro/gyroStruct.h		\
	lib/pkgconfig/gyro.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
