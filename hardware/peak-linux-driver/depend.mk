DEPEND_DEPTH:=	${DEPEND_DEPTH}+
PEAK_LINUX_DRIVER_DEPEND_MK:=${PEAK_LINUX_DRIVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	peak-linux-driver
endif

ifeq (+,$(PEAK_LINUX_DRIVER_DEPEND_MK))
PREFER.peak-linux-driver?=	robotpkg

DEPEND_USE+=	peak-linux-driver

DEPEND_ABI.peak-linux-driver?=	peak-linux-driver>=6.7
DEPEND_DIR.peak-linux-driver=../../hardware/peak-linux-driver

SYSTEM_SEARCH.peak-linux-driver=\
	include/pcan.h \
	lib/pkgconfig/pcan.pc
endif

DEPEND_DEPTH:=	${DEPEND_DEPTH:+=}
