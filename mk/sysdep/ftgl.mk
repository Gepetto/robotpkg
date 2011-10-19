# robotpkg sysdep/ftgl.mk
# Created:			Séverin Lemaignan, Wed 19 Oct 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FTGL_DEPEND_MK:=	${FTGL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ftgl
endif

ifeq (+,$(FTGL_DEPEND_MK)) # -----------------------------------------------

PREFER.ftgl?=		system
DEPEND_USE+=		ftgl
DEPEND_ABI.ftgl?=	ftgl>=2

SYSTEM_SEARCH.ftgl=\
	include/FTGL/ftgl.h				\
	'lib/libftgl.{so,a}'				\
	'lib/pkgconfig/ftgl.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.ftgl=	libftgl-dev
SYSTEM_PKG.Fedora.ftgl=	ftgl-devel
SYSTEM_PKG.NetBSD.ftgl=	wip/ftgl
SYSTEM_PKG.Ubuntu.ftgl=	libftgl-dev

endif # FTGL_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
