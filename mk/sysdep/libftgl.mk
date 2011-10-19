# robotpkg sysdep/libftgl.mk
# Created:			Séverin Lemaignan, Wed 19/10/2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFTGL_DEPEND_MK:=	${LIBFTGL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libftgl
endif

ifeq (+,$(LIBFTGL_DEPEND_MK)) # ----------------------------------------------

PREFER.libftgl?=		system
DEPEND_USE+=		    libftgl
DEPEND_ABI.libftgl?=	libftgl>=2

SYSTEM_SEARCH.libftgl=\
	include/FTGL/ftgl.h			\
	'lib/libftgl.{so,a}'				\
	'lib/pkgconfig/ftgl.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.libftgl=	libftgl-dev
SYSTEM_PKG.Debian.libftgl=	libftgl-dev

endif # LIBFTGL_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
