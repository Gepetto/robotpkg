# robotpkg Makefile for:	graphics/laaswm
# Created:			Matthieu Herrb on Mon, 9 Mar 2009
#

DISTNAME=	laaswm-1.2
COMMENT=	Remotely controllable window manager based on evilwm
CATEGORIES=	graphics

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=laaswm/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/laaswm
# this is not 100% correct, but the license is not more restricitive than isc
LICENSE=	isc

MAINTAINER=	matthieu.herrb@laas.fr

GNU_CONFIGURE=	yes

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/xorg-macros.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/libXext.mk
include ../../mk/sysdep/libXt.mk
include ../../mk/sysdep/libXxf86vm.mk
include ../../mk/sysdep/xproto.mk
include ../../mk/robotpkg.mk
