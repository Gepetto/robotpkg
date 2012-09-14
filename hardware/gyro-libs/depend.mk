# robotpkg depend.mk for:	hardware/gyro-libs
# Created:			Arnaud Degroote on Mon, 14 Jul 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GYRO_LIBS_DEPEND_MK:=${GYRO_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyro-libs
endif

ifeq (+,$(GYRO_LIBS_DEPEND_MK))
PREFER.gyro-libs?=	robotpkg

DEPEND_USE+=		gyro-libs

DEPEND_ABI.gyro-libs?=	gyro-libs>=2.0
DEPEND_DIR.gyro-libs?=	../../hardware/gyro-libs

SYSTEM_SEARCH.gyro-libs=\
	bin/gyroTest\
	include/gyroLib/gyro.h \
	lib/pkgconfig/gyro-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
