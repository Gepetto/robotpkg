# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
IMUGENOM_DEPEND_MK:=	${IMUGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		imu-genom
endif

ifeq (+,$(IMUGENOM_DEPEND_MK))
PREFER.imu-genom?=	robotpkg

DEPEND_USE+=		imu-genom

DEPEND_ABI.imu-genom?=	imu-genom>=0.1
DEPEND_DIR.imu-genom?=	../../localization/imu-genom

DEPEND_PKG_CONFIG.imu-genom+=lib/pkgconfig

SYSTEM_SEARCH.imu-genom=\
	include/imu/imuStruct.h		\
	lib/pkgconfig/imu.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
