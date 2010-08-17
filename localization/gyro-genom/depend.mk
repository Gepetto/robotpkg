# robotpkg depend.mk for:	localization/gyro-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GYROGENOM_DEPEND_MK:=	${GYROGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyro-genom
endif

ifeq (+,$(GYROGENOM_DEPEND_MK))
PREFER.gyro-genom?=	robotpkg

DEPEND_USE+=		gyro-genom

DEPEND_ABI.gyro-genom?=	gyro-genom>=0.3
DEPEND_DIR.gyro-genom?=	../../localization/gyro-genom

SYSTEM_SEARCH.gyro-genom=\
	include/gyro/gyroStruct.h		\
	lib/pkgconfig/gyro.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
