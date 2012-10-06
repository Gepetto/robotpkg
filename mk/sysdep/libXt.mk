# robotpkg sysdep/libXt.mk
# Created:			Anthony Mallet on Sun  6 Oct 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXT_DEPEND_MK:=	${LIBXT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXt
endif

ifeq (+,$(LIBXT_DEPEND_MK)) # ----------------------------------------------

PREFER.libXt?=		system
DEPEND_USE+=		libXt
DEPEND_ABI.libXt?=	libXt>=1

SYSTEM_SEARCH.libXt=	\
	include/X11/Core.h	\
	lib/libXt.so		\
	'lib/pkgconfig/xt.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libXt=libXt-devel
SYSTEM_PKG.Ubuntu.libXt=libxt-dev
SYSTEM_PKG.Debian.libXt=libxt-dev
SYSTEM_PKG.NetBSD.libXt=x11/libXt

endif # LIBXT_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
