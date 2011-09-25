# robotpkg sysdep/libXpm.mk
# Created:			Anthony Mallet on Wed 21 Sep 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXPM_DEPEND_MK:=	${LIBXPM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXpm
endif

ifeq (+,$(LIBXPM_DEPEND_MK)) # ---------------------------------------------

PREFER.libXpm?=		system
DEPEND_USE+=		libXpm

DEPEND_ABI.libXpm?=	libXpm

SYSTEM_SEARCH.libXpm=	\
	include/X11/xpm.h						\
	'lib/libXpm.{so,a}'						\
	'lib/pkgconfig/xpm.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libXpm=libXpm-devel
SYSTEM_PKG.Ubuntu.libXpm=libxpm-dev
SYSTEM_PKG.Debian.libXpm=libxpm-dev
SYSTEM_PKG.NetBSD.libXpm=pkgsrc/x11/libXpm

endif # LIBXPM_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
