# robotpkg sysdep/xorg-macros.mk
# Created:			Anthony Mallet on Wed  2 Nov 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
XORG_MACROS_DEPEND_MK:=	${XORG_MACROS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		xorg-macros
endif

ifeq (+,$(XORG_MACROS_DEPEND_MK)) # ----------------------------------------

PREFER.xorg-macros?=		system
DEPEND_USE+=			xorg-macros
DEPEND_ABI.xorg-macros?=	xorg-macros>=1

SYSTEM_SEARCH.xorg-macros=	\
	'share/pkgconfig/xorg-macros.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.xorg-macros=xutils-dev
SYSTEM_PKG.Fedora.xorg-macros=xorg-x11-util-macros
SYSTEM_PKG.NetBSD.xorg-macros=devel/xorg-util-macros
SYSTEM_PKG.Ubuntu.xorg-macros=xutils-dev

endif # XORG_MACROS_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
