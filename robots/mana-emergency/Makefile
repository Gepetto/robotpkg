# robotpkg Makefile for:	robots/mana-emergency
# Created:			Matthieu Herrb on Mon, 23 Feb 2009
#
V=		0.1.99
DISTNAME=	ftdi-emergency-${V}
PKGNAME=	mana-emergency-${V}
CATEGORIES=	robots

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=rmp400/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/ftdi-emergency
MAINTAINER=	openrobots@laas.fr
COMMENT=	Interface library for the Mana robot emergency stop

LICENSE=	isc

GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	no

# because of patch-aa
pre-configure:	m4dir autoreconf
m4dir:
	${RUN}${MKDIR} ${WRKSRC}/m4

include ../../hardware/libftdi/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
