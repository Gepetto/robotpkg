# robotpkg sysdep/libsdl-image.mk
# Created:			Séverin Lemaignan, Wed 19/10/2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSDLIMAGE_DEPEND_MK:=	${LIBSDLIMAGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libsdl-image
endif

ifeq (+,$(LIBSDLIMAGE_DEPEND_MK)) # ----------------------------------------------

PREFER.libsdl-image?=		system
DEPEND_USE+=		    libsdl-image
DEPEND_ABI.libsdl-image?=	libsdl-image>=1.2

SYSTEM_SEARCH.libsdl-image=\
	include/SDL/SDL_image.h			\
	'lib/libSDL_image.{so,a}'				\
	'lib/pkgconfig/SDL_image.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.libsdl-image=	libsdl-image1.2-dev
SYSTEM_PKG.Debian.libsdl-image=	libsdl-image1.2-dev

endif # LIBSDLIMAGE_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
