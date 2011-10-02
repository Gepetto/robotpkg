# robotpkg sysdep/libX11.mk
# Created:			Anthony Mallet on Sun  2 Oct 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBX11_DEPEND_MK:=	${LIBX11_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libX11
endif

ifeq (+,$(LIBX11_DEPEND_MK)) # ---------------------------------------------

PREFER.libX11?=		system
DEPEND_USE+=		libX11
DEPEND_ABI.libX11?=	libX11>=1

SYSTEM_SEARCH.libX11=	\
	include/X11/Xlib.h	\
	lib/libX11.so		\
	'lib/pkgconfig/x11.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libX11=libX11-devel
SYSTEM_PKG.Ubuntu.libX11=libX11-dev
SYSTEM_PKG.Debian.libX11=libX11-dev
SYSTEM_PKG.NetBSD.libX11=x11/libX11

endif # LIBX11_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
