# robotpkg depend.mk for:	hardware/libftdi
# Created:			Matthieu Herrb on Thu, 2 Apr 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFTDI_DEPEND_MK:=${LIBFTDI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libftdi
endif

ifeq (+,$(LIBFTDI_DEPEND_MK))
PREFER.libftdi?=	system

DEPEND_USE+=		libftdi

DEPEND_ABI.libftdi?=	libftdi>=0.14
DEPEND_DIR.libftdi?=	../../hardware/libftdi

SYSTEM_PKG.Fedora.libftdi=libftdi-devel
SYSTEM_PKG.Ubuntu.libftdi=libftdi-dev
SYSTEM_PKG.Debian.libftdi=libftdi-dev

SYSTEM_SEARCH.libftdi=\
	include/ftdi.h \
	lib/pkgconfig/libftdi.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
