# robotpkg sysdep/libXmu.mk
# Created:			Anthony Mallet on Fri  6 May 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXI_DEPEND_MK:=	${LIBXI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXi
endif

ifeq (+,$(LIBXI_DEPEND_MK)) # ----------------------------------------------

PREFER.libXi?=		system
DEPEND_USE+=		libXi
DEPEND_ABI.libXi?=	libXi>=1

SYSTEM_SEARCH.libXi=\
	include/X11/extensions/XInput.h			\
	'lib/libXi.{so,a}'				\
	'lib/pkgconfig/xi.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Linux-fedora.libXi=	libXi-devel
SYSTEM_PKG.Linux-ubuntu.libXi=	libxi-dev
SYSTEM_PKG.Linux-debian.libXi=	libXi-dev
SYSTEM_PKG.NetBSD.libXi=	pkgsrc/x11/libXi

endif # LIBXI_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
