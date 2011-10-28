# robotpkg sysdep/libXv.mk
# Created:			Anthony Mallet on Fri 28 Oct 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXV_DEPEND_MK:=	${LIBXV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXv
endif

ifeq (+,$(LIBXV_DEPEND_MK)) # ----------------------------------------------

PREFER.libXv?=		system
DEPEND_USE+=		libXv
DEPEND_ABI.libXv?=	libXv>=1

SYSTEM_SEARCH.libXv=	\
	include/X11/extensions/Xvlib.h	\
	lib/libXv.so			\
	'lib/pkgconfig/xv.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.libXv=libxv-dev
SYSTEM_PKG.Fedora.libXv=libXv-devel
SYSTEM_PKG.NetBSD.libXv=x11/libXv
SYSTEM_PKG.Ubuntu.libXv=libxv-dev

endif # LIBXV_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
