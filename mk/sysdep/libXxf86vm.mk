# robotpkg sysdep/libXxf86vm.mk
# Created:			Anthony Mallet on Wed  2 Nov 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXXF86VM_DEPEND_MK:=	${LIBXXF86VM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXxf86vm
endif

ifeq (+,$(LIBXXF86VM_DEPEND_MK)) # -----------------------------------------

PREFER.libXxf86vm?=		system
DEPEND_USE+=			libXxf86vm
DEPEND_ABI.libXxf86vm?=		libXxf86vm>=1

SYSTEM_SEARCH.libXxf86vm=	\
	include/X11/extensions/xf86vmode.h				\
	'lib/libXxf86vm.{so,a}'						\
	'lib/pkgconfig/xxf86vm.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.libXxf86vm=libxxf86vm-dev
SYSTEM_PKG.Fedora.libXxf86vm=libXxf86vm-devel
SYSTEM_PKG.NetBSD.libXxf86vm=x11/libXxf86vm
SYSTEM_PKG.Ubuntu.libXxf86vm=libxxf86vm-dev

endif # LIBXXF86VM_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
