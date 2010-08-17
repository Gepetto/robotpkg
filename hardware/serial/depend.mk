# robotpkg depend.mk for:	hardware/serial
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SERIAL_DEPEND_MK:=${SERIAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		serial
endif

ifeq (+,$(SERIAL_DEPEND_MK))
PREFER.serial?=	robotpkg

DEPEND_USE+=		serial

DEPEND_ABI.serial?=	serial>=1.0.1
DEPEND_DIR.serial?=	../../hardware/serial

SYSTEM_SEARCH.serial=\
	include/serial/serial.h \
	lib/pkgconfig/serial.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
