# robotpkg depend.mk for:	robots/imu-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
IMUGENOM_DEPEND_MK:=	${IMUGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		imu-genom
endif

ifeq (+,$(IMUGENOM_DEPEND_MK))
PREFER.imu-genom?=	robotpkg

DEPEND_USE+=		imu-genom

DEPEND_ABI.imu-genom?=	imu-genom>=0.2
DEPEND_DIR.imu-genom?=	../../localization/imu-genom

SYSTEM_SEARCH.imu-genom=\
	include/imu/imuStruct.h		\
	lib/pkgconfig/imu.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
