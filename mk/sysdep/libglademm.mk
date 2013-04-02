# robotpkg sysdep/libglademm.mk
# Created:			Arnaud Degroote on Mar 29 2013

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBGLADE_MM_DEPEND_MK:=		${LIBGLADE_MM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libglademm
endif

ifeq (+,$(LIBGLADE_MM_DEPEND_MK)) # ------------------------------------------------

PREFER.libglademm?=		system
DEPEND_USE+=			libglademm
DEPEND_ABI.libglademm?=	libglademm>=2.4

SYSTEM_SEARCH.libglademm=	\
	'include/libglademm-2.4/libglademm.h'				\
	'lib/libglademm-2.4.so' 							\
	'lib/pkgconfig/libglademm-2.4.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Fedora.libglademm=	libglademm24-devel
SYSTEM_PKG.Ubuntu.libglademm=	libglademm-2.4-dev
SYSTEM_PKG.Debian.libglademm=	libglademm-2.4-dev
SYSTEM_PKG.NetBSD.libglademm=	devel/libglademm

endif # LIBGLADE_MM_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
