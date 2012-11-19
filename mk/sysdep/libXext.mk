# robotpkg sysdep/libXext.mk
# Created:			Anthony Mallet on Mon 19 Nov 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXEXT_DEPEND_MK:=	${LIBXEXT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXext
endif

ifeq (+,$(LIBXEXT_DEPEND_MK)) # --------------------------------------------

PREFER.libXext?=	system
DEPEND_USE+=		libXext
DEPEND_ABI.libXext?=	libXext>=1

SYSTEM_SEARCH.libXext=	\
	include/X11/extensions/XShm.h	\
	lib/libXext.so			\
	'lib/pkgconfig/xext.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libXext=libXext-devel
SYSTEM_PKG.Ubuntu.libXext=libxext-dev
SYSTEM_PKG.Debian.libXext=libxext-dev
SYSTEM_PKG.NetBSD.libXext=x11/libXext

endif # LIBXEXT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
