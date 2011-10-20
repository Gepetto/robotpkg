# robotpkg sysdep/gtk2-engines.mk
# Created:			Anthony Mallet on Thu, 20 Oct 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GTK2_ENGINES_DEPEND_MK:=${GTK2_ENGINES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gtk2-engines
endif

ifeq (+,$(GTK2_ENGINES_DEPEND_MK)) # ---------------------------------------

PREFER.gtk2-engines?=	system
DEPEND_USE+=		gtk2-engines

DEPEND_ABI.gtk2-engines?=gtk2-engines>=2

SYSTEM_SEARCH.gtk2-engines=\
	'lib/pkgconfig/gtk-engines-2.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.gtk2-engines=	gtk2-engines
SYSTEM_PKG.Fedora.gtk2-engines=	gtk2-engines-devel
SYSTEM_PKG.NetBSD.gtk2-engines=	x11/gtk2-engines
SYSTEM_PKG.Ubuntu.gtk2-engines=	gtk2-engines

endif # GTK2_ENGINES_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
