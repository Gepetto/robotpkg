# robotpkg sysdep/xproto.mk
# Created:			Anthony Mallet on Mon 19 Nov 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
XPROTO_DEPEND_MK:=	${XPROTO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		xproto
endif

ifeq (+,$(XPROTO_DEPEND_MK)) # ---------------------------------------------

PREFER.xproto?=	system
DEPEND_USE+=		xproto
DEPEND_ABI.xproto?=	xproto>=1

SYSTEM_SEARCH.xproto=	\
	include/X11/X.h			\
	'{lib,share}/pkgconfig/xproto.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.xproto=xproto-devel
SYSTEM_PKG.Ubuntu.xproto=x11proto-core-dev
SYSTEM_PKG.Debian.xproto=x11proto-core-dev
SYSTEM_PKG.NetBSD.xproto=x11/xproto

endif # XPROTO_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
