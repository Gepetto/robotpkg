# robotpkg sysdep/SDL_net.mk
# Created:			Arnaud Degroote, Mon 16 Dec 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SDL_NET_DEPEND_MK:=	${SDL_NET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		SDL_net
endif

ifeq (+,$(SDL_NET_DEPEND_MK)) # ------------------------------------------

PREFER.SDL_net?=	system
DEPEND_USE+=		SDL_net
DEPEND_ABI.SDL_net?=	SDL_net>=1.2

SYSTEM_SEARCH.SDL_net=\
	include/SDL/SDL_net.h					\
	'lib/libSDL_net.{so,a}'				\
	'lib/pkgconfig/SDL_net.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.SDL_net=	libsdl-net1.2-dev
SYSTEM_PKG.Fedora.SDL_net=	SDL_net-devel
SYSTEM_PKG.NetBSD.SDL_net=	net/SDL_net
SYSTEM_PKG.Ubuntu.SDL_net=	libsdl-net1.2-dev

endif # SDL_NET_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
