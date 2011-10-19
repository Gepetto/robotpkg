# robotpkg sysdep/SDL.mk
# Created:			Séverin Lemaignan, Wed 19 Oct 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SDL_DEPEND_MK:=	${SDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		SDL
endif

ifeq (+,$(SDL_DEPEND_MK)) # ------------------------------------------------

PREFER.SDL?=		system
DEPEND_USE+=		SDL
DEPEND_ABI.SDL?=	SDL>=1.2

SYSTEM_SEARCH.SDL=\
	include/SDL/SDL.h				\
	'lib/libSDL.{so,a}'				\
	'lib/pkgconfig/sdl.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.SDL=	libsdl1.2-dev
SYSTEM_PKG.Fedora.SDL=	SDL-devel
SYSTEM_PKG.NetBSD.SDL=	devel/SDL
SYSTEM_PKG.Ubuntu.SDL=	libsdl1.2-dev

endif # SDL_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
