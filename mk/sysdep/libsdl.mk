# robotpkg sysdep/libsdl.mk
# Created:			Séverin Lemaignan, Wed 19/10/2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSDL_DEPEND_MK:=	${LIBSDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libsdl
endif

ifeq (+,$(LIBSDL_DEPEND_MK)) # ----------------------------------------------

PREFER.libsdl?=		system
DEPEND_USE+=		    libsdl
DEPEND_ABI.libsdl?=	libsdl>=1.2

SYSTEM_SEARCH.libsdl=\
	include/SDL/SDL.h			\
	'lib/libSDL.{so,a}'				\
	'lib/pkgconfig/sdl.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.libsdl=	libsdl1.2-dev
SYSTEM_PKG.Debian.libsdl=	libsdl1.2-dev

endif # LIBSDL_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
