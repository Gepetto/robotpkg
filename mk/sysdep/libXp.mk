# robotpkg sysdep/libXp.mk
# Created:			Xavier Broquere on Thu 28 Oct 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXP_DEPEND_MK:=	${LIBXP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXp
endif

ifeq (+,$(LIBXP_DEPEND_MK)) # ---------------------------------------------

PREFER.libXp?=		system
DEPEND_USE+=		libXp
DEPEND_ABI.libXp?=	libXp>=1

SYSTEM_SEARCH.libXp=	\
	include/X11/extensions/Print.h	\
	lib/libXp.so			\
	'lib/pkgconfig/xp.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Linux-fedora.libXp=libXp-devel
SYSTEM_PKG.Linux-ubuntu.libXp=libxp-dev
SYSTEM_PKG.Linux-debian.libXp=libxp-dev

endif # LIBXMU_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
