
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFTDI_DEPEND_MK:=${LIBFTDI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libftdi
endif

ifeq (+,$(LIBFTDI_DEPEND_MK))
PREFER.libftdi?=	robotpkg

DEPEND_USE+=		libftdi

DEPEND_ABI.libftdi?=	libftdi>=0.14
DEPEND_DIR.libftdi?=	../../hardware/libftdi

SYSTEM_SEARCH.libftdi=\
	include/ftdi.h \
	lib/libftdi.la \
	lib/pkgconfig/libftdi.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
