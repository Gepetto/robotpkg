# robotpkg depend.mk for:	hardware/gyroKVH5000
# Created:			Arnaud Degroote on Mon, 14 Jul 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GYROKVH5000_DEPEND_MK:=${GYROKVH5000_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gyroKVH5000
endif

ifeq (+,$(GYROKVH5000_DEPEND_MK))
PREFER.gyroKVH5000?=	robotpkg

DEPEND_USE+=		gyroKVH5000

DEPEND_ABI.gyroKVH5000?=	gyroKVH5000>=1.4
DEPEND_DIR.gyroKVH5000?=	../../hardware/gyroKVH5000

SYSTEM_SEARCH.gyroKVH5000=\
	bin/gyroKVH5000Test\
	include/gyroLib.h \
	lib/pkgconfig/gyroKVH5000.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
