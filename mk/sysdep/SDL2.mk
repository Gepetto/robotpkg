# robotpkg sysdep/SDL2.mk
# Created:			Anthony Mallet, Fri 15 Apr 2016
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SDL2_DEPEND_MK:=	${SDL2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		SDL2
endif

ifeq (+,$(SDL2_DEPEND_MK)) # ------------------------------------------------

PREFER.SDL2?=		system
DEPEND_USE+=		SDL2
DEPEND_ABI.SDL2?=	SDL2>=2

SYSTEM_SEARCH.SDL2=\
	include/SDL2/SDL.h				\
	'lib/libSDL2.{so,a}'				\
	'lib/pkgconfig/sdl2.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.SDL2=	libsdl2-dev
SYSTEM_PKG.Fedora.SDL2=	SDL2-devel
SYSTEM_PKG.NetBSD.SDL2=	devel/SDL2
SYSTEM_PKG.Gentoo.SDL2=	media-libs/libsdl

endif # SDL2_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
