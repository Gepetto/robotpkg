# robotpkg sysdep/bluez.mk
# Created:			Anthony Mallet on Mon Oct 17 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BLUEZ_DEPEND_MK:=	${BLUEZ_DEPEND_MK}+

# Official Linux Bluetooth protocol stack

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		bluez
endif

ifeq (+,$(BLUEZ_DEPEND_MK)) # ----------------------------------------------

PREFER.bluez?=		system

DEPEND_USE+=		bluez
DEPEND_ABI.bluez?=	bluez>=4

SYSTEM_SEARCH.bluez=	\
	'include/bluetooth/bluetooth.h'					\
	'lib/libbluetooth.{so,a}'					\
	'lib/pkgconfig/bluez.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.bluez=	libbluetooth-dev
SYSTEM_PKG.Fedora.bluez=	bluez-libs-devel
SYSTEM_PKG.Ubuntu.bluez=	libbluetooth-dev

endif # BLUEZ_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
