# robotpkg sysdep/gtkmm.mk
# Created:			Arnaud Degroote on Mar 29 2013

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GTK_MM_DEPEND_MK:=		${GTK_MM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gtkmm
endif

ifeq (+,$(GTK_MM_DEPEND_MK)) # ------------------------------------------------

PREFER.gtkmm?=		system
DEPEND_USE+=		gtkmm
DEPEND_ABI.gtkmm?=	gtkmm>=2.4

SYSTEM_SEARCH.gtkmm=	\
	'include/gtkmm-2.4/gtkmm.h'				\
	'lib/libgtkmm-2.4.la'  					\
	'lib/pkgconfig/gtkmm-2.4.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Fedora.gtkmm=	gtkmm2.4-devel
SYSTEM_PKG.Ubuntu.gtkmm=	libgtkmm-2.4-dev
SYSTEM_PKG.Debian.gtkmm=	libgtkmm-2.4-dev
SYSTEM_PKG.NetBSD.gtkmm=		x11/gtkmm

endif # GTK_MM_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
