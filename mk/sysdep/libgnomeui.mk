# robotpkg sysdep/libgnomeui.mk
# Created:			Anthony Mallet on Wed, 26 Oct 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBGNOMEUI_DEPEND_MK:=	${LIBGNOMEUI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libgnomeui
endif

ifeq (+,$(LIBGNOMEUI_DEPEND_MK)) # -----------------------------------------

PREFER.libgnomeui?=	system
DEPEND_USE+=		libgnomeui
DEPEND_ABI.libgnomeui?=	libgnomeui>=2

SYSTEM_SEARCH.libgnomeui=	\
	include/libgnomeui-2.0/libgnomeui/libgnomeui.h			\
	'lib/libgnomeui-2.{so,a}'					\
	'lib/pkgconfig/libgnomeui-2.0.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.libgnomeui=	libgnomeui-dev
SYSTEM_PKG.Fedora.libgnomeui=	libgnomeui-devel
SYSTEM_PKG.NetBSD.libgnomeui=	devel/libgnomeui
SYSTEM_PKG.Ubuntu.libgnomeui=	libgnomeui-dev

endif # LIBGNOMEUI_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
