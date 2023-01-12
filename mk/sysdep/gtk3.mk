# robotpkg sysdep/gtk3.mk
# Created:			Anthony Mallet on Tue Apr 19 2022
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GTK3_DEPEND_MK:=	${GTK3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gtk3
endif

ifeq (+,$(GTK3_DEPEND_MK)) # ------------------------------------------------

PREFER.gtk3?=		system
DEPEND_USE+=		gtk3
DEPEND_ABI.gtk3?=	gtk3>=3<4

SYSTEM_SEARCH.gtk3=	\
  'include/gtk-3.0/gtk/gtk.h'				\
  'lib/pkgconfig/gtk+-3.0.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.RedHat.gtk3=	gtk3-devel
SYSTEM_PKG.Debian.gtk3=	libgtk-3-dev
SYSTEM_PKG.NetBSD.gtk3=	x11/gtk3

include ../../mk/sysdep/gdk-pixbuf2.mk

endif # GTK3_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
