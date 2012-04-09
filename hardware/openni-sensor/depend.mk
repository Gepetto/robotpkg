# robotpkg depend.mk for:	hardware/openni-sensor
# Created:			Matthieu Herrb on Tue, 14 Dec 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENNI_SENSOR_DEPEND_MK:=${OPENNI_SENSOR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openni-sensor
endif

ifeq (+,$(OPENNI_SENSOR_DEPEND_MK))
PREFER.openni-sensor?=	robotpkg

DEPEND_USE+=		openni-sensor

DEPEND_ABI.openni-sensor?=	openni-sensor>=20120104
DEPEND_DIR.openni-sensor?=	../../hardware/openni-sensor

SYSTEM_SEARCH.openni-sensor=\
	lib/libXnDeviceFile.so \
	lib/libXnDeviceSensorV2.so

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
