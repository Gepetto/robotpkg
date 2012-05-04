# robotpkg sysdep/libusb.mk
# Created:			Anthony Mallet on Jan 25 2011

# A library which allows userspace access to USB devices
# This package provides a way for applications to access USB
# devices. Note that this library is not compatible with the
# original libusb-0.1 series

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBUSB_DEPEND_MK:=	${LIBUSB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libusb
endif

ifeq (+,$(LIBUSB_DEPEND_MK)) # ---------------------------------------------

PREFER.libusb?=		system
DEPEND_USE+=		libusb
DEPEND_ABI.libusb?=	libusb>=0.1.12<1

SYSTEM_SEARCH.libusb=\
	include/usb.h			\
	'lib/libusb.{so,a}'	\
	'lib/pkgconfig/libusb.pc:/^Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libusb=	libusb-devel
SYSTEM_PKG.Debian.libusb=	libusb-dev
SYSTEM_PKG.NetBSD.libusb=	pkgsrc/devel/libusb
SYSTEM_PKG.Ubuntu.libusb=	libusb-dev

endif # LIBUSB_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
