# robotpkg sysdep/SDL_image.mk
# Created:			Séverin Lemaignan, Wed 19 Oct 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SDL_IMAGE_DEPEND_MK:=	${SDL_IMAGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		SDL_image
endif

ifeq (+,$(SDL_IMAGE_DEPEND_MK)) # ------------------------------------------

PREFER.SDL_image?=	system
DEPEND_USE+=		SDL_image
DEPEND_ABI.SDL_image?=	SDL_image>=1.2

SYSTEM_SEARCH.SDL_image=\
	include/SDL/SDL_image.h					\
	'lib/libSDL_image.{so,a}'				\
	'lib/pkgconfig/SDL_image.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.SDL_image=	libsdl-image1.2-dev
SYSTEM_PKG.Fedora.SDL_image=	SDL_image-devel
SYSTEM_PKG.NetBSD.SDL_image=	graphics/SDL_image
SYSTEM_PKG.Ubuntu.SDL_image=	libsdl-image1.2-dev

endif # SDL_IMAGE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
