# robotpkg sysdep/gtk.mk
# Created:			Anthony Mallet on Sat Dec 13 2008
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GTK_DEPEND_MK:=		${GTK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gtk
endif

ifeq (+,$(GTK_DEPEND_MK)) # ------------------------------------------------

PREFER.gtk?=		system
DEPEND_USE+=		gtk
DEPEND_ABI.gtk?=	gtk>=2.8.17<3

SYSTEM_SEARCH.gtk=	\
	'include/gtk-2.0/gtk/gtk.h'				\
	'lib/pkgconfig/gtk+-2.0.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.gtk=	libgtk2.0-dev
SYSTEM_PKG.Fedora.gtk=	gtk2-devel
SYSTEM_PKG.Gentoo.gtk=	<x11-libs/gtk+-3
SYSTEM_PKG.NetBSD.gtk=	x11/gtk2

endif # GTK_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
