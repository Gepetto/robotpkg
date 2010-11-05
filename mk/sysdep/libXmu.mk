# robotpkg sysdep/libXmu.mk
# Created:			Xavier Broquere on Thu 28 Oct 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXMU_DEPEND_MK:=	${LIBXMU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXmu
endif

ifeq (+,$(LIBXMU_DEPEND_MK)) # ---------------------------------------------

PREFER.libXmu?=		system
DEPEND_USE+=		libXmu
DEPEND_ABI.libXmu?=	libXmu>=1

SYSTEM_SEARCH.libXmu=	\
	include/X11/Xmu/Xmu.h	\
	lib/libXmu.so		\
	'lib/pkgconfig/xmu.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Linux-fedora.libXmu=libXmu-devel
SYSTEM_PKG.Linux-ubuntu.libXmu=libXmu-dev
SYSTEM_PKG.Linux-debian.libXmu=libXmu-dev

endif # LIBXMU_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
