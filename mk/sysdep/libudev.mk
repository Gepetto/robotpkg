# robotpkg sysdep/libudev.mk
# Created:			Anthony Mallet on Aug 22 2014

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBUDEV_DEPEND_MK:=	${LIBUDEV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libudev
endif

ifeq (+,$(LIBUDEV_DEPEND_MK)) # --------------------------------------------

ONLY_FOR_PLATFORM+=	Linux-%

PREFER.libudev?=	system
DEPEND_USE+=		libudev
DEPEND_ABI.libudev?=	libudev>=0

SYSTEM_SEARCH.libudev=\
  'include/libudev.h'					\
  'lib/libudev.so'					\
  'lib/pkgconfig/libudev.pc:/^Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libudev=	systemd-devel
SYSTEM_PKG.Debian.libudev=	libudev-dev
SYSTEM_PKG.Gentoo.libudev=	sysfs-udev

endif # LIBUDEV_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
