# robotpkg sysdep/libusb1.mk
# Created:			Matthieu Herrb on Jan 11 2011

# A library which allows userspace access to USB devices
# This package provides a way for applications to access USB
# devices. Note that this library is not compatible with the
# original libusb-0.1 series

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBUSB1_DEPEND_MK:=	${LIBUSB1_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libusb1
endif

ifeq (+,$(LIBUSB1_DEPEND_MK)) # ---------------------------------------------

PREFER.libusb1?=	system
DEPEND_USE+=		libusb1
DEPEND_ABI.libusb1?=	libusb1>=1.0.6

SYSTEM_SEARCH.libusb1=\
	include/libusb-1.0/libusb.h	\
	'lib/libusb-1.0.*'		\
	'lib/pkgconfig/libusb-1.0.pc:/^Version/s/[^0-9.]//gp'

SYSTEM_PKG.Linux-fedora.libusb1=	libusb1-devel
SYSTEM_PKG.Linux-ubuntu.libusb1=	libusb-1.0-0-dev
SYSTEM_PKG.Linux-debian.libusb1=	libusb-1.0-0-dev

endif # LIBUSB1_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
