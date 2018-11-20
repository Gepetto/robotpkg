# robotpkg Makefile for:	hardware/cwiid
# Created:			Matthieu Herrb on Mon, 22 Dec 2008
#

DISTNAME=	cwiid-${VERSION}
VERSION=	0.6.00
EXTRACT_SUFX=	.tar.gz
CATEGORIES=	hardware
MASTER_SITES=	https://github.com/abstrakraft/cwiid/archive/

HOMEPAGE=	https://github.com/abstrakraft/cwiid
MAINTAINER=	openrobots@laas.fr
COMMENT=	Tools for interfacing to the Nintendo Wiimote
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/cwiid-${PKGNAME}

ONLY_FOR_PLATFORM=	Linux-%
GNU_CONFIGURE=		yes
CONFIGURE_ARGS=		--disable-ldconfig
CONFIGURE_ARGS+=	--without-python

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/bison.mk
include ../../mk/sysdep/bluez.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/gtk.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

pre-configure: autoreconf
