# robotpkg depend.mk for:	hardware/gyroKVH1000
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GYROKVH1000_DEPEND_MK:=${GYROKVH1000_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyroKVH1000
endif

ifeq (+,$(GYROKVH1000_DEPEND_MK))
PREFER.gyroKVH1000?=	robotpkg

DEPEND_USE+=		gyroKVH1000

DEPEND_ABI.gyroKVH1000?=	gyroKVH1000>=1.4
DEPEND_DIR.gyroKVH1000?=	../../hardware/gyroKVH1000

SYSTEM_SEARCH.gyroKVH1000=\
	bin/gyroKVH1000TaskTest \
	include/gyroKVH1000HardLib.h \
	lib/pkgconfig/gyroKVH1000Hard.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
